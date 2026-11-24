import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    super.key,
    required this.category,
    required this.monthName,
    required this.statusColor,
    required this.budgetStatus,
    required this.limit,
  });
  final Category category;
  final String monthName;
  final Color statusColor;
  final String budgetStatus;
  final String limit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  // color: category.color.withAlpha(25),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(200.r),
                ),
                child: Image.asset(category.iconPath, height: 26.h),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Text(limit),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          monthName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.mutedColor,
                          ),
                        ),
                        // SizedBox(width: 4.w),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 0.7.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withAlpha(20),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: statusColor.withAlpha(30),
                            ),
                          ),
                          child: Text(
                            budgetStatus,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
