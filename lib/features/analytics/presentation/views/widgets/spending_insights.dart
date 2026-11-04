import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class SpendingInsights extends StatelessWidget {
  const SpendingInsights({
    super.key,
    required this.averageDailySpending,
    required this.largestExpenseTransaction,
    // this.topExpenseCategory,
    required this.savingsRate,
  });
  final double averageDailySpending;
  final TransactionEntity largestExpenseTransaction;
  // final Category? topExpenseCategory;
  final double savingsRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          InsightRow(
            icon: Icon(
              Iconsax.wallet_3,
              // color: AppColors.tertiaryColor.withAlpha(210),
              color: Colors.lightBlue,
              size: 20.sp,
            ),
            title: 'Savings Rate',
            subTitle: 'percentage of income saved',
            value: '${savingsRate.toStringAsFixed(1)} %',
          ),
          // SizedBox(height: 12.h),
          Container(
            height: 1.1.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 14.h),
            color: Colors.white,
          ),
          InsightRow(
            icon: Icon(
              Iconsax.moneys,
              color: AppColors.expenseColor.withAlpha(210),
              size: 20.sp,
            ),
            title: 'Average Daily Spending',
            subTitle: 'average expenses per day',
            value: '${AppHelpers.formatNumber(averageDailySpending)} £',
          ),
          // SizedBox(height: 14.h),
          Container(
            height: 1.1.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 14.h),
            color: Colors.white,
          ),

          InsightRow(
            icon: Image.asset(
              largestExpenseTransaction.category.iconPath,
              height: 20.sp,
            ),
            title: 'Largest Expense',
            subTitle: largestExpenseTransaction.title,
            value:
                '${AppHelpers.formatNumber(largestExpenseTransaction.amount)} £',
          ),
        ],
      ),
    );
  }
}

class InsightRow extends StatelessWidget {
  const InsightRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.value,
  });
  final Widget icon;
  final String title;
  final String subTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(7.h),
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 152, 185, 191),
            color: AppColors.neutralColor,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300.withAlpha(200),
              width: 0.8.w,
            ),
          ),
          child: icon,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                // color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              subTitle,
              style: TextStyle(fontSize: 10.sp, color: AppColors.mutedColor),
            ),
          ],
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
