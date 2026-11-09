import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';

class CategoryBudgetItem extends StatelessWidget {
  const CategoryBudgetItem({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: AppColors.neutralColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(120.r)),
                ),
                child: Image.asset(category.iconPath, height: 22.h),
              ),
              SizedBox(width: 7.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.name, style: TextStyle(fontSize: 12.5.sp)),
                  Text(
                    'On Track',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.mutedColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text('3000', style: TextStyle(fontSize: 12.5.sp)),
              Text(
                ' £',
                style: TextStyle(
                  fontSize: 12.5.sp,
                  color: AppColors.incomeColor.withAlpha(180),
                ),
              ),
            ],
          ),
          // SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '44% USED',
                style: TextStyle(
                  fontSize: 10.sp,
                  // fontWeight: FontWeight.w700,
                  color: AppColors.expenseColor.withAlpha(180),
                  // color: textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          LinearProgressIndicator(
            value: 0.44,

            backgroundColor: AppColors.mutedColor.withAlpha(50),
            valueColor: AlwaysStoppedAnimation(category.color.withAlpha(180)),
            borderRadius: BorderRadius.circular(20.r),
            minHeight: 4.h,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '£ 1300 Spent',
                style: TextStyle(fontSize: 11.sp, color: AppColors.mutedColor),
              ),
              Spacer(),
              Text(
                '£ 1800 LEFT',
                style: TextStyle(fontSize: 11.sp, color: AppColors.mutedColor),
              ),
            ],
          ),
          // SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
