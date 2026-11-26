import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_cubit.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_state.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_error_page.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budget_header.dart';
import 'package:masroof/features/budget/presentation/views/widgets/budgets_loading_shimer.dart';
import 'package:masroof/features/budget/presentation/views/widgets/categories_budget_list.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';

class BudgetsPageBody extends StatelessWidget {
  const BudgetsPageBody({super.key, required this.selectedMonth});
  final DateTime selectedMonth;
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionAdded ||
            state is TransactionDeleted ||
            state is TransactionUpdated) {
          context.read<BudgetsCubit>().getAllTransaction();
        }
      },
      child: BlocBuilder<BudgetsCubit, BudgetsState>(
        builder: (context, state) {
          if (state is BudgetsLoading) {
            return BudgetsLoadingShimer();
          } else if (state is BudgetsSuccess) {
            final List<BudgetEntity> budgets = state.budgets;
            final Map<Category, double> expensesByCategory =
                state.expensesByCategory;
            final double totalBudget = state.totalBudget;
            final double totalSpent = state.totalSpent;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 95.h),
                    BudgetsHeader(
                      totalBudget: totalBudget,
                      totalSpent: totalSpent,
                    ),
                    SizedBox(height: 16.h),
                    CategoriesBudgettList(
                      selectedMonth: selectedMonth,
                      budgets: budgets,
                      expensesByCategory: expensesByCategory,
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            );
          } else {
            return BudgetErrorPage();
          }
        },
      ),
    );
  }
}
