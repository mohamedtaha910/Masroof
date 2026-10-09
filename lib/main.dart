import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
// import 'package:masroof/features/splash/Presentation/pages/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:masroof/features/auth/data/repos/auth_repo_impl.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AuthCubit(
            authRepo: AuthRepoImpl(
              remoteDataSource: AuthRemoteDataSourceImpl(
                firebaseAuth: FirebaseAuth.instance,
              ),
            ),
          ),
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
