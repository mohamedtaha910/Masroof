import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class CategoriesSelect extends StatefulWidget {
  const CategoriesSelect({
    super.key,
    required this.type,
    required this.onCategorySelected,
  });
  final TransactionType type;
  final ValueChanged<Category> onCategorySelected;

  @override
  State<CategoriesSelect> createState() => _CategoriesSelectState();
}

class _CategoriesSelectState extends State<CategoriesSelect> {
  Category selectedCategory = AppCategories.other;
  @override
  Widget build(BuildContext context) {
    final List<Category> categories = widget.type == TransactionType.income
        ? AppCategories.incomes
        : AppCategories.expenses;

    return CustomGlass(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        color: Colors.white.withAlpha(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 14.h),
            Wrap(
              // crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: List.generate(categories.length, (index) {
                if (!(categories.contains(selectedCategory))) {
                  selectedCategory = AppCategories.other;
                  // widget.onCategorySelected(selectedCategory);
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                      widget.onCategorySelected(selectedCategory);
                    });
                  },
                  child: CategoryShip(
                    category: categories[index],
                    isSelected: categories[index] == selectedCategory,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryShip extends StatelessWidget {
  final Category category;
  final bool isSelected;
  const CategoryShip({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor.withAlpha(200)
            : AppColors.neutralColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        category.name,
        style: TextStyle(
          fontSize: 12.sp,
          color: isSelected ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}
