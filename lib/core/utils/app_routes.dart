import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/features/home/Presentation/pages/home_page.dart';
import 'package:masroof/features/splash/Presentation/pages/on_boarding2_page.dart';
import 'package:masroof/features/splash/Presentation/pages/on_boarding_page.dart';
import 'package:masroof/features/splash/Presentation/pages/splash_page.dart';

abstract class AppRoutes {
  static const kHomePage = '/homePage';
  static const kOnBoarding1 = '/onBoarding1';
  static const kOnBoarding2 = '/onBoarding2';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return slideTransitionPage(child: const SplashPage());
        },
      ),
      GoRoute(
        path: kOnBoarding1,
        pageBuilder: (context, state) {
          return slideTransitionPage(child: const OnBoardingPage());
        },
      ),
      GoRoute(
        path: kOnBoarding2,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OnBoarding2Page());
        },
      ),
      GoRoute(
        path: kHomePage,
        pageBuilder: (context, state) {
          return slideTransitionPage(child: const HomePage());
        },
      ),
    ],
  );

  static CustomTransitionPage<T> slideTransitionPage<T>({
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      child: child,

      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 150),

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;

        final tween = Tween<Offset>(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.easeOutCubic));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
