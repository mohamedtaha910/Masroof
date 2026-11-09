import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class BudgetAppBar extends StatelessWidget {
  const BudgetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(120),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white.withAlpha(200)),
            ),
            child: Icon(Icons.chevron_left_rounded, size: 24.sp),
          ),
        ),
        Spacer(),
        Text('Monthly Budgets', style: TextStyle(fontSize: 16.sp)),
        Spacer(),
        SizedBox(width: 24.w),
      ],
    );
  }
}
