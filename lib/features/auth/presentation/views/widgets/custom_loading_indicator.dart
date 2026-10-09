import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 75.w, vertical: 50.h),
      // height: 140.h,
      // width: 200.w,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(180),

        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withAlpha(230), width: 1.w),
      ),
      child: SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(
          color: AppColors.tertiaryColor,
          // padding: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
