import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masroof/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:masroof/features/auth/data/repos/auth_repo_impl.dart';
import 'package:masroof/features/transaction/data/data_sources/transaction_remote_data_source.dart';
import 'package:masroof/features/transaction/data/repos/transaction_repo_impl.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerSingleton<AuthRemoteDataSourceImpl>(
    AuthRemoteDataSourceImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      googleSignIn: getIt.get<GoogleSignIn>(),
    ),
  );
  getIt.registerSingleton<TransactionRemoteDataSourceImpl>(
    TransactionRemoteDataSourceImpl(
      auth: getIt.get<FirebaseAuth>(),
      firestore: getIt.get<FirebaseFirestore>(),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(remoteDataSource: getIt.get<AuthRemoteDataSourceImpl>()),
  );
  getIt.registerSingleton<TransactionRepoImpl>(
    TransactionRepoImpl(
      remoteDataSource: getIt.get<TransactionRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<TransactionsCubit>(
    TransactionsCubit(transactionRepo: getIt.get<TransactionRepoImpl>()),
  );
}
