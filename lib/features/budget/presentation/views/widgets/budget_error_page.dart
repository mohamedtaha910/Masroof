import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class BudgetErrorPage extends StatelessWidget {
  const BudgetErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(22.h),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(140),

              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: Image.asset('assets/icons/cloud_error.png', height: 110.h),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 65.w),
            child: Text(
              'There Was an Error, Check Your Connection',
              style: TextStyle(color: AppColors.mutedColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
    
  }
}