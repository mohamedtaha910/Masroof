import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_app_bar.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_month_selector.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budgets_page_body.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            title: BudgetAppBar(),
          ),
        ),
      ),

      body: BudgetsPageBody(),

      floatingActionButton: BudgetMonthSelector(),
    );
  }
}
