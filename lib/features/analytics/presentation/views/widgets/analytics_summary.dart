import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class AnalyticsSummary extends StatelessWidget {
  const AnalyticsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _summaryCard(
                title: 'Income',
                amount: '9,892.65',
                icon: Icons.south_west_rounded,
                color: AppColors.incomeColor,
                background: const Color(0xFFE0F7E8),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _summaryCard(
                title: 'Expenses',
                amount: '2,500.48',
                icon: Icons.north_east_rounded,
                color: AppColors.expenseColor,
                background: const Color(0xFFFFE7EB),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _summaryCard(
          title: 'Net Savings',
          amount: '7,392.17',
          icon: Icons.account_balance_wallet_rounded,
          color: const Color(0xFF3184F4),
          background: const Color(0xFFE2EEFF),
          fullWidth: true,
        ),
      ],
    );
  }

  Widget _summaryCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
    required Color background,
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D2137).withAlpha(8),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 19.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.mutedColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 7.h),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '£ $amount',
                    style: TextStyle(
                      // color: textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
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
