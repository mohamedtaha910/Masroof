import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_info.dart';

class BudgetsHeader extends StatelessWidget {
  const BudgetsHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
                    '£ 3,250.0',
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
            value: 0.64,
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
                '£ 1,750.0 OF £ 5,000.0',
                style: TextStyle(
                  fontSize: 11.sp,
                  // fontWeight: FontWeight.w700,
                  color: AppColors.mutedColor,
                  // color: textColor,
                ),
              ),
              Spacer(),
              Text(
                '64% USED',
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
