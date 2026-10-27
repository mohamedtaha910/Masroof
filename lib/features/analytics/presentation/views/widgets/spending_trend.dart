import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/chart_card.dart';

class SpendingTrend extends StatelessWidget {
  const SpendingTrend({super.key});

  @override
  Widget build(BuildContext context) {
    const values = [600.0, 450, 700, 550, 900, 750, 1100];

    return ChartCard(
      title: 'Spending Trend',
      child: SizedBox(
        height: 190.h,
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: 1500,
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
                  reservedSize: 38.w,
                  interval: 500,
                  getTitlesWidget: (value, meta) => Text(
                    value == 0 ? '0' : '${value.toInt()}',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.mutedColor,
                    ),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final labels = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun',
                    ];
                    final index = value.toInt();
                    if (index < 0 || index >= labels.length) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: AppColors.mutedColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  values.length,
                  (index) => FlSpot(index.toDouble(), values[index].toDouble()),
                ),
                isCurved: true,
                color: const Color(0xFF3987F5),
                barWidth: 3,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: const Color(0xFF3987F5).withAlpha(25),
                ),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
