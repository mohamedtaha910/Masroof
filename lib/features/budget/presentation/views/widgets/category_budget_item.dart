import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_cubit.dart';
import 'package:masroof/features/budget/presentation/views/widgets/pop_up_menu_button.dart';

class CategoryBudgetItem extends StatelessWidget {
  const CategoryBudgetItem({
    super.key,
    required this.category,
    required this.spent,
    required this.onSetBudget,
    this.budget,
    required this.left,
    required this.onDeleteBudget,
    required this.selectedMonth,
  });

  final DateTime selectedMonth;
  final Category category;
  final BudgetEntity? budget;
  final double spent;
  final double? left;
  final VoidCallback onSetBudget;
  final VoidCallback onDeleteBudget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: budget == null ? _buildNoBudgetItem() : _buildBudgetItem(context),
    );
  }

  Widget _buildCategoryIcon() {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.neutralColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(120.r),
      ),
      child: Image.asset(category.iconPath, height: 22.h),
    );
  }

  Widget _buildNoBudgetItem() {
    return Row(
      children: [
        _buildCategoryIcon(),
        SizedBox(width: 7.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.name, style: TextStyle(fontSize: 12.5.sp)),
              SizedBox(height: 1.h),
              Text(
                '£ $spent SPENT, No Limit',
                style: TextStyle(fontSize: 11.sp, color: AppColors.mutedColor),
              ),
            ],
          ),
        ),
        CustomButton(
          borderRadius: 8,
          colors: [
            AppColors.primaryColor.withAlpha(180),
            AppColors.primaryColor.withAlpha(220),
          ],
          horizontalPadding: 16,
          verticalPadding: 4,
          onTap: onSetBudget,
          child: Text(
            'Set',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }

  Widget _buildBudgetItem(BuildContext context) {
    final limit = budget!.limit;

    final progress = limit > 0
        ? (spent / limit).clamp(0.0, 1.0).toDouble()
        : 0.0;

    final percentage = limit > 0 ? (spent / limit * 100).round() : 0;

    final remaining = limit - spent;
    final isOverBudget = spent > limit;
    final isReachBudget = spent == limit;
    final isAlmost = percentage >= 75 && percentage < 100;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  _buildCategoryIcon(),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: TextStyle(fontSize: 12.5.sp),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          isOverBudget
                              ? 'Over Budget'
                              : isReachBudget
                              ? 'Budget Reached'
                              : isAlmost
                              ? 'Almost There'
                              : 'On Track',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: isOverBudget || isReachBudget
                                ? AppColors.expenseColor.withAlpha(180)
                                : isAlmost
                                ? Colors.orange.withAlpha(190)
                                : AppColors.mutedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    limit.toStringAsFixed(0),
                    style: TextStyle(fontSize: 12.5.sp),
                  ),
                  Text(
                    ' £',
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      color: AppColors.incomeColor.withAlpha(180),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$percentage% USED',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: isOverBudget || isReachBudget
                          ? AppColors.expenseColor.withAlpha(180)
                          : isAlmost
                          ? Colors.orange.withAlpha(180)
                          : AppColors.mutedColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.mutedColor.withAlpha(50),
                valueColor: AlwaysStoppedAnimation(
                  isOverBudget
                      ? AppColors.expenseColor.withAlpha(220)
                      : category.color.withAlpha(180),
                ),
                borderRadius: BorderRadius.circular(20.r),
                minHeight: 4.h,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    '£ $spent SPENT',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.mutedColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    remaining >= 0
                        ? '£ ${AppHelpers.formatNumber(remaining)} LEFT'
                        : '£ ${AppHelpers.formatNumber(remaining.abs())} OVER',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: remaining < 0
                          ? AppColors.expenseColor.withAlpha(180)
                          : AppColors.mutedColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        PopUpMenuButton(
          onBudgetInfo: () {
            GoRouter.of(context).push(
              AppRoutes.kBudgetDetailsPage,
              extra: {
                'month': selectedMonth,
                'category': category,
                'budget': budget,
                'spent': spent,
              },
            );
          },
          onSetBudget: onSetBudget,
          onDeleteBudget: onDeleteBudget,
        ),
      ],
    );
  }
}
