import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_cubit.dart';
import 'package:masroof/features/budget/presentation/views/widgets/add_budget_sheet.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_budget_item.dart';
import 'package:masroof/features/budget/presentation/views/widgets/confirm_delete_budget.dart';

class CategoriesBudgettList extends StatelessWidget {
  const CategoriesBudgettList({
    super.key,
    required this.budgets,
    required this.expensesByCategory,
    required this.selectedMonth,
  });

  final List<BudgetEntity> budgets;
  final Map<Category, double> expensesByCategory;
  final DateTime selectedMonth;

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = AppCategories.expenses;

    final budgetsCubit = context.read<BudgetsCubit>();

    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        final double categoryExpense = expensesByCategory[category] ?? 0;

        final budget = budgets.firstWhereOrNull(
          (element) => element.category.name == category.name,
        );

        final double? left = budget == null
            ? null
            : budget.limit - categoryExpense;

        return CategoryBudgetItem(
          selectedMonth: selectedMonth,
          onDeleteBudget: () {
            // showAboutDialog(context: context)
            if (budget != null) {
              confirmDeleteBudget(context, budget: budget);
            }
          },
          onSetBudget: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              builder: (_) {
                return AddBudgetBottomSheet(
                  category: category,
                  selectedMonth: selectedMonth,
                  budget: budget,
                  onSubmit: (amount) {
                    if (budget == null) {
                      budgetsCubit.addBudget(
                        budget: BudgetEntity(
                          category: category,
                          limit: amount,
                          month: selectedMonth,
                        ),
                      );
                    } else {
                      budgetsCubit.updateBudget(
                        budget: BudgetEntity(
                          id: budget.id,
                          category: category,
                          limit: amount,
                          month: selectedMonth,
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
          category: category,
          left: left,
          budget: budget,
          spent: categoryExpense,
        );
      },
    );
  }
}
