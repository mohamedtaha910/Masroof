import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
// import 'package:masroof/features/splash/Presentation/pages/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/core/utils/bloc_observer.dart';
import 'package:masroof/core/utils/service_locator.dart';
import 'package:masroof/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:masroof/features/auth/data/repos/auth_repo_impl.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/features/transaction/data/data_sources/transaction_remote_data_source.dart';
import 'package:masroof/features/transaction/data/repos/transaction_repo_impl.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '145262125390-asd0iipkull3avkd49k9svhtd8jo4p0e.apps.googleusercontent.com',
  );
  Bloc.observer = SimpleBlocObserver();
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      rebuildFactor: (oldData, newData) {
        return oldData != newData &&
            (oldData.size != newData.size ||
                oldData.orientation != newData.orientation ||
                oldData.padding != newData.padding);
      },
      autoRebuild: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AuthCubit(authRepo: getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => TransactionsCubit(
                transactionRepo: TransactionRepoImpl(
                  remoteDataSource: TransactionRemoteDataSourceImpl(
                    firestore: FirebaseFirestore.instance,
                    auth: getIt.get<FirebaseAuth>(),
                  ),
                ),
              ),
            ),
          ],
          child: MaterialApp.router(
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android:
                      PredictiveBackPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),

              scaffoldBackgroundColor: AppColors.neutralColor,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),

              // fontFamily: 'Poppins',
            ),

            routerConfig: AppRoutes.router,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
