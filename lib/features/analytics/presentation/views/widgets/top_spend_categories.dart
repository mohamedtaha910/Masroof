import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';

class TopSpendCategories extends StatelessWidget {
  const TopSpendCategories({
    super.key,
    required this.categories,
    required this.totalExpense,
  });
  final Map<Category, double> categories;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    // categories.entries.toList().sort((a, b) => a.value.compareTo(b.value));
    // final List<MapEntry<Category, double>> topCategories = categories.entries
    //     .toList();
    final topCategories =
        categories.entries.where((entry) => entry.value > 0).toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    final topThree = topCategories.take(3).toList();

    if (topThree.isEmpty || totalExpense <= 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(120),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: topThree.length,
        itemBuilder: (context, index) {
          MapEntry<Category, double> category = topThree[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 18.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category.key.name,
                        style: TextStyle(
                          fontSize: 12.sp,
                          // color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '£ ${AppHelpers.formatNumber(category.value)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        // color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: LinearProgressIndicator(
                    value: totalExpense == 0
                        ? 0
                        : category.value / totalExpense,
                    minHeight: 7.h,
                    // backgroundColor: const Color(0xFFEDF1F7),
                    backgroundColor: AppColors.neutralColor,
                    // backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(category.key.color),
                  ),
                ),
              ],
            ),
          );
          ;
        },
      ),
    );
  }
}
