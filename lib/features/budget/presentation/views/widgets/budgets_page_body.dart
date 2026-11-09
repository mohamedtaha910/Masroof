import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_header.dart';
import 'package:masroof/features/budget/presentation/views/widgets/categories_budget_list.dart';

class BudgetsPageBody extends StatelessWidget {
  const BudgetsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 95.h),
            BudgetsHeader(),
            SizedBox(height: 16.h),
            CategoriesBudgettList(),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
