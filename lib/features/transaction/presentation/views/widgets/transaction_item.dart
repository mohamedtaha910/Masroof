import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    // debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');

    // debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white.withAlpha(180), Colors.white.withAlpha(180)],
        ),
        border: Border.all(color: Colors.white, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7.h),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 152, 191, 210),
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(10),
            ),
            // child: Icon(Iconsax.shopping_cart, size: 18.h, color: Colors.white),
            child: Image.asset('assets/category_icons/taxi2.png', height: 24.h),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transaction $index', style: TextStyle(fontSize: 13.sp)),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    'October 14',
                    style: TextStyle(
                      color: Colors.black.withAlpha(150),
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColors.incomeColor.withAlpha(30)
                          : AppColors.expenseColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                        color: index.isEven
                            ? AppColors.incomeColor.withAlpha(40)
                            : AppColors.expenseColor.withAlpha(30),
                        width: 0.8.w,
                      ),
                    ),

                    child: Row(
                      children: [
                        SvgPicture.asset(
                          index.isEven
                              ? 'assets/icons/income.svg'
                              : 'assets/icons/expense.svg',
                          height: 8.h,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          index.isEven ? 'Income' : 'Expense',
                          style: TextStyle(
                            color: Colors.black.withAlpha(200),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text('\$ 124.50', style: TextStyle(fontSize: 13.sp)),
        ],
      ),
    );
  }
}
