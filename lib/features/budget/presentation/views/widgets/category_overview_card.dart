import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/helper.dart';

class CategoryOverviewCard extends StatelessWidget {
  const CategoryOverviewCard({super.key, required this.spent, required this.hasBudget, required this.percentage, required this.limit, required this.color, required this.progress, required this.remaining});
  final double spent;
  final bool hasBudget;
  final double percentage;
  final double limit;
  final Color color;
  final double progress;
  final double remaining;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // colors: [AppColors.primaryColor, AppColors.secondaryColor],
          colors: [
            Colors.white.withAlpha(200),
            Colors.white.withAlpha(150),
            Colors.white.withAlpha(130),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'TOTAL SPENT',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.mutedColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '£ ${AppHelpers.formatNumber(spent)}',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          if (hasBudget) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${percentage.round()}% USED',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedColor,
                  ),
                ),
                Text(
                  '${AppHelpers.formatNumber(limit)} £',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.mutedColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(100),
              value: progress,
              minHeight: 6.h,
              backgroundColor: AppColors.neutralColor,
              valueColor: AlwaysStoppedAnimation(
                percentage > 100 ? AppColors.expenseColor :color,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              remaining >= 0
                  ? '£ ${AppHelpers.formatNumber(remaining)} LEFT'
                  : '£ ${AppHelpers.formatNumber(remaining.abs())} Over Budget',
              style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
            ),
          ] else
            Text(
              'You have spent this amount without setting a budget for this category.',
              style: TextStyle(
                fontSize: 12.sp,
                height: 1.5,
                color: AppColors.mutedColor,
              ),
            ),
        ],
      ),
    );
    
  }
}