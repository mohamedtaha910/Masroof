import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/chart_card.dart';

class ExpensesBreakdown extends StatelessWidget {
  const ExpensesBreakdown({
    super.key,
    required this.categories,
    required this.totalExpense,
  });
  final Map<Category, double> categories;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    final topCategories =
        categories.entries.where((entry) => entry.value > 0).toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    return ChartCard(
      title: 'Expense Breakdown',
      child: Column(
        children: [
          SizedBox(
            height: 185.h,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    centerSpaceRadius: 70.r,
                    sectionsSpace: 1.2,
                    sections: categories.entries.map((category) {
                      return PieChartSectionData(
                        value: category.value,
                        color: category.key.color,
                        radius: 24.r,
                        showTitle: false,
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 78.h,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Text(
                        '£ ${AppHelpers.formatNumber(totalExpense).length < 10 ? AppHelpers.formatNumber(totalExpense) : AppHelpers.formatNumber(totalExpense).substring(0, 11)}',
                        // '2222222222222',
                        style: TextStyle(fontSize: 13.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Total Spent',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.mutedColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                height: 1.1.h,

                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8.h),
                color: Colors.white,
              );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: topCategories.length,
            itemBuilder: (context, index) {
              MapEntry<Category, double> category = topCategories[index];
              final percentage = totalExpense == 0
                  ? 0.0
                  : ((category.value / totalExpense) * 100).roundToDouble();
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: category.key.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(category.key.iconPath, height: 14.h),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.key.name,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Total Spent : ${AppHelpers.formatNumber(category.value)}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.mutedColor,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '$percentage',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.mutedColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ' %',
                      style: TextStyle(
                        fontSize: 12.sp,

                        color: AppColors.mutedColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
