import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masroof/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:masroof/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn.instance);

  getIt.registerSingleton<AuthRemoteDataSourceImpl>(
    AuthRemoteDataSourceImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      googleSignIn: getIt.get<GoogleSignIn>(),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(remoteDataSource: getIt.get<AuthRemoteDataSourceImpl>()),
  );
}
