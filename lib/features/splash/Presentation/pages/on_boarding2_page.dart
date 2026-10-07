import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';

class OnBoarding2Page extends StatelessWidget {
  const OnBoarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: CustomButton(
          color: Colors.grey.shade100,
          borderRadius: 200,
          horizontalPadding: 4,
          verticalPadding: 4,
          onTap: () {
            GoRouter.of(context).pop();
          },

          border: Border.all(color: Colors.grey.shade300, width: 0.8.w),
          child: Icon(
            Icons.chevron_left_rounded,
            size: 28.sp,
            color: Colors.black,
          ),
        ),
      ),
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
                    right: 0,
                    left: 0,
                    bottom: 10.h,
                    child: Image.asset(
                      'assets/on_boarding_icons/mobile_track.png',
                      height: 200.h,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Text(
                'Track every expense',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Effortlessly log daily spending with custom categories, payment method tags, and automated receipt insights in Egyptian Pounds (EGP).',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 1),
              CustomButton(
                borderRadius: 100,
                color: AppColors.primaryColor,
                horizontalPadding: 20,
                verticalPadding: 10,
                onTap: () {
                  // GoRouter.of(context).push();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start Tracking',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
