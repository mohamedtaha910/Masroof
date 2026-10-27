import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/chart_card.dart';

class ExpensesBreakdown extends StatelessWidget {
  const ExpensesBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('Food', 32.0, const Color(0xFF3987F5)),
      ('Transport', 18.0, const Color(0xFF34C759)),
      ('Shopping', 15.0, const Color(0xFFFFA62B)),
      ('Bills', 12.0, const Color(0xFF9B6BEE)),
      ('Other', 23.0, const Color(0xFFB7C4D8)),
    ];

    return ChartCard(
      title: 'Expense Breakdown',
      child: Column(
        children: [
          SizedBox(
            height: 185.h,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 43.r,
                sectionsSpace: 3,
                sections: categories.map((category) {
                  return PieChartSectionData(
                    value: category.$2,
                    color: category.$3,
                    radius: 24.r,
                    showTitle: false,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          ...categories.map((category) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                children: [
                  Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: category.$3,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      category.$1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.mutedColor,
                      ),
                    ),
                  ),
                  Text(
                    '${category.$2.toInt()}%',
                    style: TextStyle(
                      fontSize: 12.sp,
                      // color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
