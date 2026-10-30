import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';

class AnalyticsHeader extends StatelessWidget {
  const AnalyticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Analytics',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  // color: textColor,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                'Understand your spending habits',
                style: TextStyle(fontSize: 10.sp, color: AppColors.mutedColor),
              ),
            ],
          ),
        ),
        Container(
          // width: 44.w,
          // height: 44.w,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(120),
            border: Border.all(color: Colors.white.withAlpha(200)),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Icon(
            Iconsax.calendar,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
        ),
      ],
    );
  }
}
