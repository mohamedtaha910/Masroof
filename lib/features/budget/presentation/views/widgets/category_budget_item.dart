import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';

class CategoryBudgetItem extends StatelessWidget {
  const CategoryBudgetItem({
    super.key,
    required this.category,
    required this.spent,
    required this.onSetBudget,
    this.budget,
  });

  final Category category;
  final BudgetEntity? budget;
  final double spent;
  final VoidCallback onSetBudget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: budget == null ? _buildNoBudgetItem() : _buildBudgetItem(),
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
              Text(
                '£ ${spent.toStringAsFixed(0)} SPENT, No Limit',
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
      ],
    );
  }

  Widget _buildBudgetItem() {
    final limit = budget!.limit;

    final progress = limit > 0
        ? (spent / limit).clamp(0.0, 1.0).toDouble()
        : 0.0;

    final percentage = limit > 0 ? (spent / limit * 100).round() : 0;

    final remaining = limit - spent;
    final isOverBudget = spent > limit;

    return Column(
      children: [
        Row(
          children: [
            _buildCategoryIcon(),
            SizedBox(width: 7.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.name, style: TextStyle(fontSize: 12.5.sp)),
                  Text(
                    isOverBudget ? 'Over Budget' : 'On Track',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: isOverBudget
                          ? AppColors.expenseColor
                          : AppColors.mutedColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(limit.toStringAsFixed(0), style: TextStyle(fontSize: 12.5.sp)),
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
                color: AppColors.expenseColor.withAlpha(180),
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
                ? AppColors.expenseColor
                : category.color.withAlpha(180),
          ),
          borderRadius: BorderRadius.circular(20.r),
          minHeight: 4.h,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(
              '£ ${spent.toStringAsFixed(0)} SPENT',
              style: TextStyle(fontSize: 11.sp, color: AppColors.mutedColor),
            ),
            const Spacer(),
            Text(
              remaining >= 0
                  ? '£ ${remaining.toStringAsFixed(0)} LEFT'
                  : '£ ${remaining.abs().toStringAsFixed(0)} OVER',
              style: TextStyle(
                fontSize: 11.sp,
                color: remaining < 0
                    ? AppColors.expenseColor
                    : AppColors.mutedColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
// import 'package:masroof/core/utils/app_colors.dart';
// import 'package:masroof/core/utils/categories.dart';
// import 'package:masroof/core/widgets/custom_button.dart';

// class CategoryBudgetItem extends StatelessWidget {
//   const CategoryBudgetItem({
//     super.key,
//     required this.category,
//     required this.isBudget,
//   });
//   final bool isBudget;
//   final Category category;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//       margin: EdgeInsets.symmetric(vertical: 6.h),
//       decoration: BoxDecoration(
//         color: Colors.white.withAlpha(120),
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.all(Radius.circular(12.r)),
//       ),
//       child: !isBudget
//           ? Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(8),

//                   decoration: BoxDecoration(
//                     color: AppColors.neutralColor,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.all(Radius.circular(120.r)),
//                   ),
//                   child: Image.asset(category.iconPath, height: 22.h),
//                 ),
//                 SizedBox(width: 7.h),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(category.name, style: TextStyle(fontSize: 12.5.sp)),
//                     Text(
//                       '£ 1300 SPENT, No Limit',
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: AppColors.mutedColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 CustomButton(
//                   // width: ,
//                   borderRadius: 8,
//                   colors: [
//                     AppColors.primaryColor.withAlpha(180),
//                     AppColors.primaryColor.withAlpha(220),
//                   ],
//                   horizontalPadding: 16,
//                   verticalPadding: 4,
//                   onTap: () {},
//                   child: Text(
//                     'Set',
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             )
//           : Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(8),

//                       decoration: BoxDecoration(
//                         color: AppColors.neutralColor,
//                         border: Border.all(color: Colors.white),
//                         borderRadius: BorderRadius.all(Radius.circular(120.r)),
//                       ),
//                       child: Image.asset(category.iconPath, height: 22.h),
//                     ),
//                     SizedBox(width: 7.h),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           category.name,
//                           style: TextStyle(fontSize: 12.5.sp),
//                         ),
//                         Text(
//                           'On Track',
//                           style: TextStyle(
//                             fontSize: 11.sp,
//                             color: AppColors.mutedColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     Text('3000', style: TextStyle(fontSize: 12.5.sp)),
//                     Text(
//                       ' £',
//                       style: TextStyle(
//                         fontSize: 12.5.sp,
//                         color: AppColors.incomeColor.withAlpha(180),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // SizedBox(height: 3.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       '44% USED',
//                       style: TextStyle(
//                         fontSize: 10.sp,
//                         // fontWeight: FontWeight.w700,
//                         color: AppColors.expenseColor.withAlpha(180),
//                         // color: textColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 4.h),
//                 LinearProgressIndicator(
//                   value: 0.44,

//                   backgroundColor: AppColors.mutedColor.withAlpha(50),
//                   valueColor: AlwaysStoppedAnimation(
//                     category.color.withAlpha(180),
//                   ),
//                   borderRadius: BorderRadius.circular(20.r),
//                   minHeight: 4.h,
//                 ),
//                 SizedBox(height: 8.h),
//                 Row(
//                   children: [
//                     Text(
//                       '£ 1300 SPENT',
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: AppColors.mutedColor,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       '£ 1800 LEFT',
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: AppColors.mutedColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // SizedBox(height: 8.h),
//               ],
//             ),
//     );
//   }
// }
