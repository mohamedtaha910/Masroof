import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class TopSpendCategories extends StatelessWidget {
  const TopSpendCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('Food & Groceries', 800.0, 0.32, const Color(0xFF3987F5)),
      ('Transportation', 450.0, 0.18, AppColors.incomeColor),
      ('Shopping', 375.0, 0.15, const Color(0xFFFFA62B)),
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: categories.map((category) {
          return Padding(
            padding: EdgeInsets.only(bottom: 18.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category.$1,
                        style: TextStyle(
                          fontSize: 12.sp,
                          // color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '£ ${category.$2.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        // color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: LinearProgressIndicator(
                    value: category.$3,
                    minHeight: 7.h,
                    // backgroundColor: const Color(0xFFEDF1F7),
                    backgroundColor: AppColors.neutralColor,
                    // backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(category.$4),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}