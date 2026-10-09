import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key, required this.formWidget});
  final Widget formWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              CustomButton(
                color: Colors.white.withAlpha(50),
                borderRadius: 200,
                horizontalPadding: 18,
                verticalPadding: 16,
                onTap: () {},
                border: Border.all(
                  color: Colors.grey.shade300.withAlpha(150),
                  width: 0.8.w,
                ),
                // child: Image.asset(
                //   'assets/app_icons/masroof_icon.png',
                //   // height: 75.h,
                //   width: 72.w,
                // ),
                child: Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  size: 75.sp,
                  color: AppColors.secondaryColor,
                ),
              ),
              // SizedBox(height: 8.h),
              // SvgPicture.asset('assets/app_icons/Masroof.svg', height: 14.h),
              SizedBox(height: 22.h),
              formWidget,
              SizedBox(height: 24.h),
            ],
          ),
        ),

        Positioned(
          top: 32.h,
          left: 16.w,
          child: CustomButton(
            color: Colors.white.withAlpha(60),
            borderRadius: 200,
            horizontalPadding: 3,
            verticalPadding: 3,
            onTap: () {
              GoRouter.of(context).pop();
            },

            border: Border.all(
              color: Colors.grey.shade300.withAlpha(150),
              width: 0.8.w,
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 28.sp,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 80.h,
          left: 65.w,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withAlpha(40), width: 1),
            ),
          ),
        ),
        Positioned(
          top: 130.h,
          right: 40.w,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withAlpha(40), width: 1),
            ),
          ),
        ),
        Positioned(
          top: 32.h,
          right: -40.w,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withAlpha(65), width: 1),
            ),
          ),
        ),
        Positioned(
          top: 70.h,
          left: -43.w,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withAlpha(65), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
