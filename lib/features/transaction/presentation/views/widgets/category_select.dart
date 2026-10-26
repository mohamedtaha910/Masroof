import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class CategoriesSelect extends StatefulWidget {
  const CategoriesSelect({
    super.key,
    required this.type,
    required this.onCategorySelected,
    this.initialCategory,
  });
  final TransactionType type;
  final ValueChanged<Category> onCategorySelected;
  final Category? initialCategory;

  @override
  State<CategoriesSelect> createState() => _CategoriesSelectState();
}

class _CategoriesSelectState extends State<CategoriesSelect> {
  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = widget.type == TransactionType.income
        ? AppCategories.incomes
        : AppCategories.expenses;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CustomBlur(
          sigmaX: 7,
          sigmay: 7,
          radius: 0,
          child: AppBar(
            title: Row(
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
                Text('Select Category', style: TextStyle(fontSize: 16.sp)),
                Spacer(),
                SizedBox(width: 24.w),
              ],
            ),

            // centerTitle: true,
            automaticallyImplyLeading: false,
            // backgroundColor: AppColors.neutralColor.withAlpha(10),
            // surfaceTintColor: AppColors.neutralColor,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 1.h),
              child: Container(
                height: 1.h,
                width: double.infinity,
                color: Colors.white.withAlpha(200),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withAlpha(180)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Category',
                    style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                  ),
                  SizedBox(height: 18.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    // alignment: WrapAlignment.start,
                    spacing: 14,
                    // runSpacing: 8,
                    children: List.generate(categories.length, (index) {
                      // if (!(categories.contains(selectedCategory))) {
                      //   selectedCategory = AppCategories.other;
                      //   widget.onCategorySelected(selectedCategory);
                      // }
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index];
                            widget.onCategorySelected(selectedCategory!);
                            context.pop();
                          });
                        },
                        child: CategoryShip(
                          category: categories[index],
                          isSelected: categories[index] == selectedCategory,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(200),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300.withAlpha(200)),
            ),
            child: Image.asset(category.iconPath, height: 26),
          ),
          SizedBox(width: 12.w),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 12.5.sp,
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
          const Spacer(),
          Icon(Icons.chevron_right_rounded, size: 22.sp, color: Colors.black54),
        ],
      ),
    );
  }
}
