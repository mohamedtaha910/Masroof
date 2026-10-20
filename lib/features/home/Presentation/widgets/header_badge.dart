import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/core/utils/app_colors.dart';

class HeaderBadge extends StatelessWidget {
  const HeaderBadge({super.key, required this.isIncome, required this.value});
  final bool isIncome;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(180),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(150), width: 1.w),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.dg),
            decoration: BoxDecoration(
              color: isIncome
                  ? AppColors.incomeColor.withAlpha(70)
                  : AppColors.expenseColor.withAlpha(60),
              shape: BoxShape.circle,
              border: Border.all(
                // color: Colors.white.withAlpha(100),
                color: isIncome
                    ? AppColors.incomeColor.withAlpha(35)
                    : AppColors.expenseColor.withAlpha(25),
                width: 0.8.w,
              ),
            ),
            child: SvgPicture.asset(
              isIncome ? 'assets/icons/income.svg' : 'assets/icons/expense.svg',
              colorFilter: ColorFilter.mode(
                isIncome ? Color(0xff34C759) : Color(0xffFF383C),
                BlendMode.srcIn,
              ),
              height: 11.h,
              width: 11.w,
            ),
          ),
          SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isIncome ? 'Income' : 'Expense',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withAlpha(160),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '£ $value',
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
