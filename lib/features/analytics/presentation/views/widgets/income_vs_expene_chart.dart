import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/chart_card.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/custom_legend.dart';

class IncomeVsExpeneChart extends StatelessWidget {
  const IncomeVsExpeneChart({super.key});

  @override
  Widget build(BuildContext context) {
    const income = [2200.0, 2500, 3000, 2600, 3100, 2800];
    const expenses = [1500.0, 1800, 2200, 1900, 2100, 1700];
    const labels = ['1', '5', '10', '15', '20', '25'];

    return ChartCard(
      title: 'Income vs Expenses',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLegend(color: AppColors.incomeColor, label: 'Income'),
              SizedBox(width: 24.w),
              CustomLegend(color: AppColors.expenseColor, label: 'Expenses'),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 210.h,
            child: BarChart(
              BarChartData(
                maxY: 4000,
                minY: 0,
                barTouchData: BarTouchData(enabled: true),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) =>
                      FlLine(color: const Color(0xFFEDF1F7), strokeWidth: 1),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35.w,
                      interval: 1000,
                      getTitlesWidget: (value, meta) => Text(
                        value == 0 ? '0' : '${value ~/ 1000}k',
                        style: TextStyle(
                          color: AppColors.mutedColor,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28.h,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= labels.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            labels[index],
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.mutedColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: List.generate(labels.length, (index) {
                  return BarChartGroupData(
                    x: index,
                    barsSpace: 5.w,
                    barRods: [
                      BarChartRodData(
                        toY: income[index].toDouble(),
                        color: AppColors.incomeColor,
                        width: 8.w,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(4.r),
                          topRight: Radius.circular(4.r),
                        ),
                      ),
                      BarChartRodData(
                        toY: expenses[index].toDouble(),
                        color: AppColors.expenseColor,
                        width: 8.w,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(4.r),
                          topRight: Radius.circular(4.r),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ],
      ),
    );
  }
}
