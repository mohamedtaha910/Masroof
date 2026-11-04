import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class NoAnalytics extends StatelessWidget {
  const NoAnalytics({super.key, this.text = 'No Analytics Available'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(height: 105.h),

          Container(
            padding: EdgeInsets.all(42),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(120),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(120.r)),
            ),
            child: Image.asset('assets/icons/empty_state.png', height: 90.h),
          ),

          SizedBox(height: 28.h),
          Text(
            text,
            style: TextStyle(color: AppColors.mutedColor, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
