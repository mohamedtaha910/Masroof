// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
// import 'package:masroof/core/utils/app_colors.dart';

// class AnalyticsPage extends StatelessWidget {
//   const AnalyticsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Analytics ', style: TextStyle(fontSize: 18.sp)),
//         backgroundColor: AppColors.neutralColor.withAlpha(100),
//         surfaceTintColor: Colors.transparent,
//         bottom: PreferredSize(
//           preferredSize: Size(double.infinity, 1.h),
//           child: Container(
//             height: 1.h,
//             width: double.infinity,
//             color: Colors.white.withAlpha(200),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_header.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_summary.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/expenses_breakdown.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/income_vs_expene_chart.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/spending_trend.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/top_spend_categories.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int selectedPeriod = 1;

  final periods = ['Week', 'Month', 'Year'];

  static const incomeColor = Color(0xFF34C759);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 100.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnalyticsHeader(),
              SizedBox(height: 24.h),
              _periodSelector(),
              SizedBox(height: 20.h),
              AnalyticsSummary(),
              SizedBox(height: 20.h),
              IncomeVsExpeneChart(),
              SizedBox(height: 20.h),
              ExpensesBreakdown(),
              SizedBox(height: 20.h),
              SpendingTrend(),
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
              TopSpendCategories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _periodSelector() {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        children: List.generate(periods.length, (index) {
          final isSelected = selectedPeriod == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedPeriod = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Center(
                  child: Text(
                    periods[index],
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // Widget _buildTopCategories() {

  // }

  // Widget _legend(Color color, String label) {

  // }
}
