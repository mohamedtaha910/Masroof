import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class TransactionDetailsHeader extends StatelessWidget {
  const TransactionDetailsHeader({
    super.key,
    required this.category,
    required this.title,
    required this.amout,
    required this.type,
  });
  final Category category;
  final String title;
  final String amout;
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(180)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(100),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white.withAlpha(180)),
            ),
            child: Image.asset(category.iconPath, height: 40.h),
          ),
          SizedBox(height: 12.h),
          Text(title.toUpperCase(), style: TextStyle(fontSize: 16.sp)),

          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(amout, style: TextStyle(fontSize: 28.sp)),
              Text(
                ' EGP',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: type == TransactionType.income
                      ? AppColors.incomeColor.withAlpha(180)
                      : AppColors.expenseColor.withAlpha(150),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
