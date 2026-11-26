import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_break_down.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_details_app_bar.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_status_card.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_header.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_overview_card.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_transaction.dart';

class BudgetDetailsPage extends StatelessWidget {
  const BudgetDetailsPage({
    super.key,
    required this.category,
    this.budget,
    required this.selectedMonth,
    required this.spent,
  });

  final Category category;
  final BudgetEntity? budget;
  final DateTime selectedMonth;
  final double spent;

  String get monthName {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[selectedMonth.month - 1]} ${selectedMonth.year}';
  }

  double get limit => budget?.limit ?? 0;

  double get remaining => limit - spent;

  double get percentage {
    if (limit <= 0) return 0;
    return spent / limit * 100;
  }

  double get progress {
    return (percentage / 100).clamp(0.0, 1.0);
  }

  bool get hasBudget => budget != null;

  String get budgetStatus {
    if (!hasBudget) return 'No Budget Set';
    if (percentage > 100) return 'Over Budget';
    if (percentage == 100) return 'Budget Reached';
    if (percentage >= 85) return 'Almost There';
    return 'On Track';
  }

  Color get statusColor {
    if (!hasBudget) return AppColors.mutedColor;
    if (percentage >= 100) return AppColors.expenseColor;
    if (percentage >= 85) return Colors.orange;
    return AppColors.incomeColor;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');
    debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: AppColors.neutralColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),

        child: CustomBlur(
          radius: 0,
          sigmaX: 8,
          sigmay: 8,
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.neutralColor.withAlpha(150),
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 1.h),
              child: Container(
                height: 1.h,
                width: double.infinity,
                color: Colors.white.withAlpha(200),
              ),
            ),
            title: BudgetDetailsAppBar(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            CategoryHeader(
              limit: budget != null ? '${budget?.limit} £' : '',
              category: category,
              monthName: monthName,
              statusColor: statusColor,
              budgetStatus: budgetStatus,
            ),
            SizedBox(height: 12.h),
            CategoryOverviewCard(
              spent: spent,
              hasBudget: hasBudget,
              percentage: percentage,
              limit: limit,
              color: category.color,
              progress: progress,
              remaining: remaining,
            ),
            SizedBox(height: 16.h),
            _buildSectionTitle('Budget Breakdown'),
            SizedBox(height: 12.h),
            BudgetBreakDown(
              hasBudget: hasBudget,
              limit: limit,
              spent: spent,
              remaining: remaining,
            ),
            SizedBox(height: 16.h),
            BudgetStatusCard(
              hasBudget: hasBudget,
              percentage: percentage,
              statusColor: statusColor,
              budgetStatus: budgetStatus,
            ),
            SizedBox(height: 16.h),
            _buildSectionTitle('Recent Transaction'),
            SizedBox(height: 8.h),
            CategoryTransaction(
              category: category,
              selectedMonth: selectedMonth,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }
}
