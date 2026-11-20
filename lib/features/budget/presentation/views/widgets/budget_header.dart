import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_info.dart';

class BudgetsHeader extends StatelessWidget {
  const BudgetsHeader({
    super.key,
    required this.totalBudget,
    required this.totalSpent,
  });
  final double totalBudget;
  final double totalSpent;

  @override
  Widget build(BuildContext context) {
    final percent = totalBudget > 0
        ? (totalSpent / totalBudget * 100).round()
        : 0;

    final progress = totalBudget > 0
        ? (totalSpent / totalBudget).clamp(0.0, 1.0).toDouble()
        : 0.0;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LEFT TO SPEND',
                    style: TextStyle(
                      fontSize: 11.sp,
                      // fontWeight: FontWeight.w700,
                      color: AppColors.mutedColor,
                      // color: textColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    // '£ 3,250.0',
                    '£ ${AppHelpers.formatNumber(totalBudget)}',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      // color: textColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.neutralColor,
                  borderRadius: BorderRadius.circular(100),
                  // border: Border.all(color: AppColors.mutedColor.withAlpha(30)),
                  border: Border.all(color: Colors.white),
                ),
                child: Image.asset(
                  'assets/app_icons/wallet4.png',
                  height: 25.h,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),
          LinearProgressIndicator(
            value: progress,
            // backgroundColor: AppColors.incomeColor.withAlpha(40),
            backgroundColor: AppColors.mutedColor.withAlpha(50),
            valueColor: AlwaysStoppedAnimation(
              AppColors.expenseColor.withAlpha(180),
            ),
            borderRadius: BorderRadius.circular(20.r),
            minHeight: 5.h,
          ),

          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                '£ ${AppHelpers.formatNumber(totalSpent)} OF £ ${AppHelpers.formatNumber(totalBudget)}',
                style: TextStyle(
                  fontSize: 11.sp,
                  // fontWeight: FontWeight.w700,
                  color: AppColors.mutedColor,
                  // color: textColor,
                ),
              ),
              Spacer(),
              Text(
                '$percent% USED',
                style: TextStyle(
                  fontSize: 11.sp,
                  // fontWeight: FontWeight.w700,
                  color: AppColors.expenseColor.withAlpha(180),
                  // color: textColor,
                ),
              ),
            ],
          ),
          // SizedBox(height: 12.h),
          // CustomHorizintalline(height: 1.3),
          // SizedBox(height: 12.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Total Budget',
          //           style: TextStyle(
          //             fontSize: 11.sp,
          //             // fontWeight: FontWeight.w700,
          //             color: AppColors.mutedColor,
          //             // color: textColor,
          //           ),
          //         ),
          //         SizedBox(height: 6.h),

          //         Text(
          //           '£ 5,000.0',
          //           style: TextStyle(
          //             fontSize: 13.sp,
          //             fontWeight: FontWeight.w700,
          //             // color: textColor,
          //           ),
          //         ),
          //       ],
          //     ),
          //     CustomVerticalline(height: 38, width: 1.5),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Total Spent',
          //           style: TextStyle(
          //             fontSize: 11.sp,
          //             // fontWeight: FontWeight.w700,
          //             color: AppColors.mutedColor,
          //             // color: textColor,
          //           ),
          //         ),
          //         SizedBox(height: 6.h),
          //         Text(
          //           '£ 1,750.0',
          //           style: TextStyle(
          //             fontSize: 13.sp,
          //             fontWeight: FontWeight.w700,
          //             // color: textColor,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
