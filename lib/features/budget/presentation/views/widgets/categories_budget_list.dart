import 'package:flutter/material.dart';
import 'package:masroof/core/utils/categories.dart';
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
        return CategoryBudgetItem(category: category);
      },
    );
  }
}
