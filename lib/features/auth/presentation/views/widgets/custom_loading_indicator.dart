import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:masroof/core/utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.w, sigmaY: 12.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 75.w, vertical: 50.h),
          height: 140.h,
          width: 200.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withAlpha(70),

            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.white.withAlpha(120), width: 1.w),
          ),
          child: SpinKitFadingCircle(
            size: 40.r,
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven
                      ? AppColors.tertiaryColor.withAlpha(220)
                      : Colors.white.withAlpha(220),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
