import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';
import 'package:masroof/features/analytics/presentation/manager/analytics_cubit/analytics_cubit.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_header.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_summary.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/expenses_breakdown.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/income_vs_expene_chart.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/spending_trend.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/top_spend_categories.dart';

class AnalyticsBody extends StatefulWidget {
  const AnalyticsBody({super.key, required this.analyticsEntity});
  final AnalyticsEntity analyticsEntity;

  @override
  State<AnalyticsBody> createState() => _AnalyticsBodyState();
}

class _AnalyticsBodyState extends State<AnalyticsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        AnalyticsSummary(
          totalIncome: widget.analyticsEntity.totalIncome,
          totalExpense: widget.analyticsEntity.totalExpenses,
          netSaving: widget.analyticsEntity.netSavings,
        ),
        SizedBox(height: 20.h),
        IncomeVsExpeneChart(),
        SizedBox(height: 20.h),
        ExpensesBreakdown(
          totalExpense: widget.analyticsEntity.totalExpenses,
          categories: widget.analyticsEntity.expensesByCategory,
        ),
        SizedBox(height: 20.h),
        // SpendingTrend(),
        SizedBox(height: 24.h),
        Text(
          'Top Spending Categories',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            // color: textColor,
          ),
        ),
        SizedBox(height: 12.h),
        TopSpendCategories(
          categories: widget.analyticsEntity.expensesByCategory,
          totalExpense: widget.analyticsEntity.totalExpenses,
        ),
      ],
    );
  }

  // Widget _periodSelector() {
  //   return Container(
  //     padding: EdgeInsets.all(2.w),
  //     decoration: BoxDecoration(
  //       color: Colors.white.withAlpha(100),
  //       border: Border.all(color: Colors.white),
  //       borderRadius: BorderRadius.circular(100.r),
  //     ),
  //     child: Row(
  //       children: List.generate(periods.length, (index) {
  //         bool isSelected = selectedPeriod == index;

  //         return Expanded(
  //           child: GestureDetector(
  //             // onTap: () {
  //             //   setState(() => selectedPeriod = index);
  //             //   _loadSelectedPeriod();
  //             // },
  //             onTap: () {
  //               if (selectedPeriod == index) return;

  //               setState(() {
  //                 selectedPeriod = index;
  //               });

  //               _loadSelectedPeriod();
  //             },
  //             child: AnimatedContainer(
  //               duration: const Duration(milliseconds: 100),
  //               curve: Curves.easeInOut,
  //               padding: EdgeInsets.symmetric(vertical: 8.h),
  //               decoration: BoxDecoration(
  //                 color: isSelected
  //                     ? AppColors.primaryColor
  //                     : Colors.transparent,
  //                 borderRadius: BorderRadius.circular(100.r),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   periods[index],
  //                   style: TextStyle(
  //                     fontSize: 11.sp,
  //                     fontWeight: FontWeight.w600,
  //                     color: isSelected ? Colors.white : Colors.black54,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }

  // Widget _periodSelector() {
  //   return Container(
  //     padding: EdgeInsets.all(2.w),
  //     decoration: BoxDecoration(
  //       color: Colors.white.withAlpha(100),
  //       border: Border.all(color: Colors.white),
  //       borderRadius: BorderRadius.circular(100.r),
  //     ),
  //     child: Row(
  //       children: List.generate(periods.length, (index) {
  //         final isSelected = selectedPeriod == index;

  //         return Expanded(
  //           child: GestureDetector(
  //             behavior: HitTestBehavior.opaque,
  //             onTap: () {
  //               _loadSelectedPeriod();
  //               setState(() {
  //                 selectedPeriod = index;
  //               });
  //             },
  //             child: AnimatedContainer(
  //               duration: const Duration(milliseconds: 200),
  //               curve: Curves.easeInOut,
  //               padding: EdgeInsets.symmetric(vertical: 8.h),
  //               decoration: BoxDecoration(
  //                 color: isSelected
  //                     ? AppColors.primaryColor
  //                     : Colors.transparent,
  //                 borderRadius: BorderRadius.circular(100.r),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   periods[index],
  //                   style: TextStyle(
  //                     fontSize: 11.sp,
  //                     fontWeight: FontWeight.w600,
  //                     color: isSelected ? Colors.white : Colors.black54,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }
}
