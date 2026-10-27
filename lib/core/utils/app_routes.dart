import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/auth/presentation/views/pages/login_page.dart';
import 'package:masroof/features/auth/presentation/views/pages/sign_up_page.dart';
import 'package:masroof/features/analytics/presentation/views/pages/analytics_page.dart';
import 'package:masroof/features/home/Presentation/views/pages/app_root.dart';
import 'package:masroof/features/home/Presentation/views/pages/home_page.dart';
import 'package:masroof/features/profile/presentation/views/profile_page.dart';
import 'package:masroof/features/splash/Presentation/pages/on_boarding2_page.dart';
import 'package:masroof/features/splash/Presentation/pages/on_boarding_page.dart';
import 'package:masroof/features/splash/Presentation/pages/splash_page.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/pages/add_transaction_page.dart';
import 'package:masroof/features/transaction/presentation/views/pages/edit_transaction_page.dart';
import 'package:masroof/features/transaction/presentation/views/pages/transaction_details.dart';
import 'package:masroof/features/transaction/presentation/views/pages/transaction_page.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/category_select.dart';

abstract class AppRoutes {
  static const krootPage = '/rootpage';
  static const kHomePage = '/homePage';
  static const kOnBoarding1 = '/onBoarding1';
  static const kOnBoarding2 = '/onBoarding2';
  static const kLoginPage = '/onLogin';
  static const kSignUpPage = '/signUp';
  static const kTransactionPage = '/transaction';
  static const kprofilePage = '/profilePage';
  static const kAnalyticsPage = '/analyticsdPage';
  static const kAddTransactionPage = '/addTransactionPage';
  static const kTransactionDetails = '/TransactionDetails';
  static const kEditTransactionPage = '/EditTransactionPage';
  static const kCategoriesSelect = '/categoriesSelect';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: const SplashPage());
        },
      ),
      GoRoute(
        path: kOnBoarding1,
        pageBuilder: (context, state) {
          return MaterialPage(child: const OnBoardingPage());
        },
      ),
      GoRoute(
        path: kOnBoarding2,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OnBoarding2Page());
        },
      ),
      GoRoute(
        path: kLoginPage,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        path: kSignUpPage,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignUpPage());
        },
      ),
      GoRoute(
        path: kAddTransactionPage,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddTransactionPage());
        },
      ),
      GoRoute(
        path: kTransactionDetails,
        pageBuilder: (context, state) {
          final transaction = state.extra as TransactionEntity;
          return MaterialPage(
            child: TransactionDetails(transaction: transaction),
          );
        },
      ),
      GoRoute(
        path: kEditTransactionPage,
        pageBuilder: (context, state) {
          final transaction = state.extra as TransactionEntity;
          return MaterialPage(
            child: EditTransactionPage(transaction: transaction),
          );
        },
      ),

      GoRoute(
        path: kCategoriesSelect,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return CategoriesSelect(
            initialCategory: extra['initialCategory'] as Category?,
            type: extra['type'] as TransactionType,
            onCategorySelected:
                extra['onCategorySelected'] as ValueChanged<Category>,
          );
        },
      ),

      // GoRoute(
      //   path: krootPage,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: AppRoot());
      //   },
      // ),
      // GoRoute(
      //   path: kHomePage,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: HomePage());
      //   },
      // ),
      // GoRoute(
      //   path: kTransactionPage,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: TransactionPage());
      //   },
      // ),
      // GoRoute(
      //   path: kdashboardPage,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: DashboardPage());
      //   },
      // ),
      // GoRoute(
      //   path: kprofilePage,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: ProfilePage());
      // },
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppRoot(navigationShell: navigationShell);
        },
        branches: [
          // Tab 0: Dashboard
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kHomePage,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),

          // Tab 1: Transactions
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kTransactionPage,
                builder: (context, state) => const TransactionPage(),
              ),
            ],
          ),

          // Tab 2: Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kAnalyticsPage,
                builder: (context, state) => const AnalyticsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kprofilePage,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
