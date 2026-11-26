import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_info.dart';

class BudgetBreakDown extends StatelessWidget {
  const BudgetBreakDown({super.key, required this.hasBudget, required this.limit, required this.spent, required this.remaining});
  final bool hasBudget;
  final double limit;
  final double spent;
  final double remaining;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildBreakdownRow(
            title: 'Budget Limit',
            amount: hasBudget
                ? '${AppHelpers.formatNumber(limit)} £'
                : 'Not Set',
            icon: Icons.speed_rounded,
            color: AppColors.secondaryColor,
          ),
          // _buildDivider(),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomHorizintalline(),
          ),
          SizedBox(height: 14.h),
          _buildBreakdownRow(
            title: 'Total Spent',
            amount: '${AppHelpers.formatNumber(spent)} £',
            icon: Iconsax.moneys,
            color: AppColors.expenseColor.withAlpha(240),
          ),
          if (hasBudget) ...[
            // _buildDivider(),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomHorizintalline(),
            ),
            SizedBox(height: 14.h),
            _buildBreakdownRow(
              title: remaining >= 0 ? 'Remaining' : 'Over Budget',
              amount: '${AppHelpers.formatNumber(remaining.abs())} £',
              icon: remaining >= 0 ? Iconsax.wallet_2 : Icons.warning_rounded,
              color: remaining >= 0
                  ? AppColors.incomeColor
                  : AppColors.expenseColor,
            ),
          ],
        ],
      ),
    );
  }

   Widget _buildBreakdownRow({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: color.withAlpha(20),
            borderRadius: BorderRadius.circular(200.r),
            border: Border.all(color: color.withAlpha(20)),
          ),
          child: Icon(icon, color: color, size: 19.sp),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}