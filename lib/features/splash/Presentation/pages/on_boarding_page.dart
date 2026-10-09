import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/widgets/custom_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withAlpha(40),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryColor.withAlpha(40),
                        width: 0.8.w,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    left: 0,
                    bottom: 33.h,
                    child: Image.asset(
                      'assets/on_boarding_icons/hand_money.png',
                      height: 200.h,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Text(
                'Take control of your money',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Understand where every pound goes. Masroof automatically organizes your income and expenses into clear, effortless financial clarity.',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black54,

                  // fontWeight: FontWeight.,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 1),
              CustomButton(
                width: double.infinity,
                borderRadius: 100,
                color: AppColors.primaryColor,
                horizontalPadding: 20,
                verticalPadding: 10,
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kOnBoarding2);
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
