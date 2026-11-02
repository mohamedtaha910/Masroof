import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_summary.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/expenses_breakdown.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/period_comparison.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/spending_insights.dart';
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
        // SizedBox(height: 20.h),
        // IncomeVsExpeneChart(),
        SizedBox(height: 20.h),
        ExpensesBreakdown(
          totalExpense: widget.analyticsEntity.totalExpenses,
          categories: widget.analyticsEntity.expensesByCategory,
        ),
        // SizedBox(height: 20.h),
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
        SizedBox(height: 24.h),
        Text(
          'Spending Comparison',
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        PeriodComparison(
          analytics: widget.analyticsEntity,
          previousPeriodLabel: 'Previous Period',
        ),
        SizedBox(height: 24.h),
        Text(
          'Spending Insights',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            // color: textColor,
          ),
        ),
        SizedBox(height: 12.h),
        SpendingInsights(
          averageDailySpending: widget.analyticsEntity.averageDailySpending,
          largestExpenseTransaction:
              widget.analyticsEntity.largestExpenseTransaction,
          // topExpenseCategory: widget.analyticsEntity.topExpenseCategory,
          savingsRate: widget.analyticsEntity.savingsRate,
        ),
      ],
    );
  }
}
