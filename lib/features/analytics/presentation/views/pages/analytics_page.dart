
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/analytics/presentation/manager/analytics_cubit/analytics_cubit.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_builder.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_header.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int selectedPeriod = 1;

  final periods = ['Week', 'Month', 'Year'];

  DateTimeRange getSelectedDateRange() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    switch (selectedPeriod) {
      case 0: // Week: today and the previous 6 days
        return DateTimeRange(
          start: today.subtract(const Duration(days: 6)),
          end: today.add(const Duration(days: 1)),
        );

      case 1: // Current month
        return DateTimeRange(
          start: DateTime(now.year, now.month),
          end: DateTime(now.year, now.month + 1),
        );

      // case 2: // Current month and previous 2 months
      //   return DateTimeRange(
      //     start: DateTime(now.year, now.month - 2),
      //     end: DateTime(now.year, now.month + 1),
      //   );

      case 2: // Current year
        return DateTimeRange(
          start: DateTime(now.year),
          end: DateTime(now.year + 1),
        );

      default:
        return DateTimeRange(
          start: DateTime(now.year, now.month),
          end: DateTime(now.year, now.month + 1),
        );
    }
  }

  void _loadSelectedPeriod() async {
    final range = getSelectedDateRange();

    await BlocProvider.of<AnalyticsCubit>(
      context,
    ).loadAnalytics(startDate: range.start, endDate: range.end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 100.h),
          child: Column(
            children: [
              AnalyticsHeader(),
              SizedBox(height: 24.h),
              _periodSelector(),
              AnalyticsBuilder(),
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
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (selectedPeriod == index) return;

                setState(() {
                  selectedPeriod = index;
                });

                _loadSelectedPeriod();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
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
}
