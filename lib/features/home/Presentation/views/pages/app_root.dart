import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/home/Presentation/views/widgets/custom_nav_bar.dart';
import 'package:masroof/features/home/Presentation/views/widgets/custom_shadow.dart';

class AppRoot extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppRoot({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');
    debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: navigationShell),
          Positioned(bottom: 0, right: 0, left: 0, child: CustomShadow()),

          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
            child: Row(
              children: [
                Expanded(
                  child: CustomNavBar(
                    selectedIndex: navigationShell.currentIndex,
                    onChanged: (index) {
                      navigationShell.goBranch(
                        index,
                        initialLocation: index == navigationShell.currentIndex,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                CustomGlass(
                  child: CustomBlur(
                    radius: 100,
                    sigmaX: 2,
                    sigmay: 2,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRoutes.kAddTransactionPage);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 13.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100.withAlpha(60),
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: Colors.white.withAlpha(220),
                          ),
                        ),
                        child: Icon(Icons.add, size: 20.h),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
