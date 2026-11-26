
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';

class BudgetStatusCard extends StatelessWidget {
  const BudgetStatusCard({super.key, required this.hasBudget, required this.percentage, required this.statusColor, required this.budgetStatus});
  final bool hasBudget;
  final double percentage;
  final Color statusColor;
  final String budgetStatus;
  @override
  Widget build(BuildContext context) {
     String message;

    if (!hasBudget) {
      message =
          'Set a monthly budget to start tracking your spending in this category.';
    } else if (percentage > 100) {
      message =
          'You have exceeded your budget. Consider reviewing your expenses for this category.';
    } else if (percentage == 100) {
      message =
          'You have reached your entire budget. Be careful with any additional spending.';
    } else if (percentage >= 85) {
      message =
          'You are getting close to your budget limit. Keep an eye on your spending.';
    } else {
      message =
          'Great job! Your spending is currently within your budget limit.';
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: statusColor.withAlpha(15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: statusColor.withAlpha(35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Iconsax.info_circle_copy, color: statusColor, size: 22.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  budgetStatus,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    height: 1.5,
                    color: AppColors.primaryColor,
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