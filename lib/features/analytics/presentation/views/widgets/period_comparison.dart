import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';

class PeriodComparison extends StatelessWidget {
  const PeriodComparison({
    super.key,
    required this.analytics,
    required this.previousPeriodLabel,
  });

  final AnalyticsEntity analytics;
  final String previousPeriodLabel;

  @override
  Widget build(BuildContext context) {
    final change = analytics.expenseChangePercentage;

    final isDecrease = change != null && change <= 0;
    final color = isDecrease
        ? const Color(0xFF34C759)
        : const Color(0xFFFF383C);

    final double difference =
        analytics.totalExpenses - analytics.prevTotalExpenses;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),

          if (change == null)
            Center(
              child: Text(
                'No previous spending data available',
                style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
              ),
            )
          else ...[
            Row(
              children: [
                Icon(
                  isDecrease
                      ? Icons.trending_down_rounded
                      : Icons.trending_up_rounded,
                  color: color,
                  size: 18.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  '${change.abs().toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: color,
                    fontSize: 13.sp.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    isDecrease
                        ? 'Less spending than $previousPeriodLabel'
                        : difference == 0
                        ? 'Same spending as $previousPeriodLabel'
                        : 'More spending than $previousPeriodLabel',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            _comparisonRow('Current Period', analytics.totalExpenses),
            SizedBox(height: 12.h),
            _comparisonRow(previousPeriodLabel, analytics.prevTotalExpenses),
            SizedBox(height: 14.h),
            // Divider(color: Colors.grey.shade200),
            Container(
              height: 1.1.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 12.h),
              color: Colors.white,
            ),
            Text(
              difference < 0
                  ? 'You spent £ ${AppHelpers.formatNumber(difference.abs())} less'
                  : difference > 0
                  ? 'You spent £ ${AppHelpers.formatNumber(difference)} more'
                  : 'Your spending remained the same',
              style: TextStyle(
                color: color,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _comparisonRow(String title, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
        ),
        Text(
          '${AppHelpers.formatNumber(amount)} £',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
