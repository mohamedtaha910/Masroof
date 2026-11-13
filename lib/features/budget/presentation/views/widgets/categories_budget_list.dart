import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/presentation/views/widgets/add_budget_sheet.dart';
import 'package:masroof/features/budget/presentation/views/widgets/category_budget_item.dart';

class CategoriesBudgettList extends StatelessWidget {
  const CategoriesBudgettList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = AppCategories.expenses;
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryBudgetItem(
          onSetBudget: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              builder: (context) {
                return AddBudgetBottomSheet(
                  category: category,
                  selectedMonth: DateTime.now(),
                  onCreate: (amount) {
                    // هنربطها بالـ Cubit في الخطوة الجاية
                  },
                );
              },
            );
          },
          category: category,
          spent: 1300,
          budget: index > 5
              ? null
              : BudgetEntity(
                  category: category,
                  limit: 3000,
                  month: DateTime.now(),
                ),
        );
      },
    );
  }
}
