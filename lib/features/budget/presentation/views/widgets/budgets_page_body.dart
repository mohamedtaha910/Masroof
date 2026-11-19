import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_cubit.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_state.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_header.dart';
import 'package:masroof/features/budget/presentation/views/widgets/categories_budget_list.dart';

class BudgetsPageBody extends StatelessWidget {
  const BudgetsPageBody({super.key, required this.selectedMonth});
  final DateTime selectedMonth;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetsCubit, BudgetsState>(
      builder: (context, state) {
        if (state is BudgetsLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CustomLoadingIndicator())],
          );
        } else if (state is BudgetsSuccess) {
          final List<BudgetEntity> budgets = state.budgets;
          final Map<Category, double> expensesByCategory =
              state.expensesByCategory;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 95.h),
                  BudgetsHeader(),
                  SizedBox(height: 16.h),
                  CategoriesBudgettList(
                    budgets: budgets,
                    expensesByCategory: expensesByCategory,
                  ),
                  SizedBox(height: 80.h),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text('Connection Error'));
        }
      },
    );
  }
}
