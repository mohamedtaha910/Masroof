import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_cubit.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_details_app_bar.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_header.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_transaction.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_info.dart';

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
    List<TransactionEntity> transactions = BlocProvider.of<BudgetsCubit>(
      context,
    ).getTransactionsByCategory(category: category, month: selectedMonth);
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
            // _buildCategoryHeader(),
            CategoryHeader(
              limit: budget != null ? '${budget?.limit} £' : 'No Limit',
              category: category,
              monthName: monthName,
              statusColor: statusColor,
              budgetStatus: budgetStatus,
            ),
            SizedBox(height: 12.h),
            _buildOverviewCard(),
            SizedBox(height: 16.h),
            _buildSectionTitle('Budget Breakdown'),
            SizedBox(height: 12.h),
            _buildBreakdown(),
            SizedBox(height: 16.h),
            _buildStatusCard(),
            SizedBox(height: 16.h),
            _buildSectionTitle('Recent Transaction'),
            SizedBox(height: 12.h),
            CategoryTransaction(transactions: transactions),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // colors: [AppColors.primaryColor, AppColors.secondaryColor],
          colors: [
            Colors.white.withAlpha(200),
            Colors.white.withAlpha(150),
            Colors.white.withAlpha(130),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'TOTAL SPENT',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.mutedColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '£ ${AppHelpers.formatNumber(spent)}',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          if (hasBudget) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${percentage.round()}% USED',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedColor,
                  ),
                ),
                Text(
                  '${AppHelpers.formatNumber(limit)} £',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.mutedColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(100),
              value: progress,
              minHeight: 6.h,
              backgroundColor: AppColors.neutralColor,
              valueColor: AlwaysStoppedAnimation(
                percentage > 100 ? AppColors.expenseColor : category.color,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              remaining >= 0
                  ? '£ ${AppHelpers.formatNumber(remaining)} LEFT'
                  : '£ ${AppHelpers.formatNumber(remaining.abs())} Over Budget',
              style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
            ),
          ] else
            Text(
              'You have spent this amount without setting a budget for this category.',
              style: TextStyle(
                fontSize: 12.sp,
                height: 1.5,
                color: AppColors.mutedColor,
              ),
            ),
        ],
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

  Widget _buildBreakdown() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildBreakdownRow(
            title: 'Budget Limit',
            amount: hasBudget
                ? '${AppHelpers.formatNumber(limit)} £'
                : 'Not Set',
            icon: Icons.speed_rounded,
            color: AppColors.secondaryColor,
          ),
          // _buildDivider(),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomHorizintalline(),
          ),
          SizedBox(height: 14.h),
          _buildBreakdownRow(
            title: 'Total Spent',
            amount: '${AppHelpers.formatNumber(spent)} £',
            icon: Iconsax.moneys,
            color: AppColors.expenseColor.withAlpha(240),
          ),
          if (hasBudget) ...[
            // _buildDivider(),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomHorizintalline(),
            ),
            SizedBox(height: 14.h),
            _buildBreakdownRow(
              title: remaining >= 0 ? 'Remaining' : 'Over Budget',
              amount: '${AppHelpers.formatNumber(remaining.abs())} £',
              icon: remaining >= 0 ? Iconsax.wallet_2 : Icons.warning_rounded,
              color: remaining >= 0
                  ? AppColors.incomeColor
                  : AppColors.expenseColor,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBreakdownRow({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: color.withAlpha(20),
            borderRadius: BorderRadius.circular(200.r),
            border: Border.all(color: color.withAlpha(20)),
          ),
          child: Icon(icon, color: color, size: 19.sp),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  // Widget _buildDivider() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 14.h),
  //     child: Divider(height: 1, color: AppColors.neutralColor),
  //   );
  // }

  Widget _buildStatusCard() {
    String message;

    if (!hasBudget) {
      message =
          'Set a monthly budget to start tracking your spending in this category.';
    } else if (percentage > 100) {
      message =
          'You have exceeded your budget. Consider reviewing your expenses for this category.';
    } else if (percentage == 100) {
      message =
          'You have reached your entire budget. Be careful with any additional spending.';
    } else if (percentage >= 85) {
      message =
          'You are getting close to your budget limit. Keep an eye on your spending.';
    } else {
      message =
          'Great job! Your spending is currently within your budget limit.';
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: statusColor.withAlpha(15),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: statusColor.withAlpha(35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, color: statusColor, size: 22.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  budgetStatus,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    height: 1.5,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =================================

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:masroof/core/utils/categories.dart';
// import 'package:masroof/features/budget/domain/entities/budget_entity.dart';

// class BudgetDetailsPage extends StatelessWidget {
//   const BudgetDetailsPage({
//     super.key,
//     required this.category,
//     this.budget,
//     required this.selectedMonth,
//     required this.spent,
//   });
//   final Category category;
//   final BudgetEntity? budget;
//   final DateTime selectedMonth;
//   final double spent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('${category.name} Budget Page ')),
//     );
//   }
// }
