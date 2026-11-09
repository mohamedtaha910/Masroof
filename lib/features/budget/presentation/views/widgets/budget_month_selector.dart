import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/core/widgets/custom_glass.dart';

class BudgetMonthSelector extends StatefulWidget {
  const BudgetMonthSelector({super.key});

  @override
  State<BudgetMonthSelector> createState() => _BudgetMonthSelectorState();
}

class _BudgetMonthSelectorState extends State<BudgetMonthSelector> {
  DateTime selectedMonth = DateTime.now();

  void changeMonth(int value) {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 12.h),
      padding: EdgeInsetsGeometry.only(left: 30.w),
      child: CustomGlass(
        child: CustomBlur(
          radius: 120,
          sigmaX: 2,
          sigmay: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor.withAlpha(180),
              borderRadius: BorderRadius.circular(120.r),
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => changeMonth(-1),
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.black,
                    size: 26.sp,
                  ),
                ),
                Text(
                  '${_monthName(selectedMonth.month)} ${selectedMonth.year}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => changeMonth(1),
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.black,
                    size: 26.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }
}
