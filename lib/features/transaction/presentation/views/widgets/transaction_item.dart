import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.index,
    required this.transaction,
  });
  final TransactionEntity transaction;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isIncome = transaction.type == TransactionType.income;

    // debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');
    // debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');
    return GestureDetector(
      onTap: () => GoRouter.of(
        context,
      ).push(AppRoutes.kTransactionDetails, extra: transaction),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white.withAlpha(120), Colors.white.withAlpha(120)],
            // colors: [Colors.white.withAlpha(150), Colors.white.withAlpha(150)],
          ),
          border: Border.all(color: Colors.white.withAlpha(150), width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(7.5.h),
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 152, 185, 191),
                color: AppColors.neutralColor,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade300.withAlpha(200),
                  width: 0.8.w,
                ),
              ),
              // child: Icon(Iconsax.shopping_cart, size: 18.h, color: Colors.white),
              child: Image.asset(
                // 'assets/category_icons/transport.png',
                transaction.category.iconPath,
                // 'assets/category_icons/work.png',
                height: 26.h,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title, style: TextStyle(fontSize: 12.5.sp)),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      DateFormat('MMM dd, yyyy').format(transaction.date),
                      style: TextStyle(
                        color: Colors.black.withAlpha(150),
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.5.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: isIncome
                            ? AppColors.incomeColor.withAlpha(30)
                            : AppColors.expenseColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                          color: isIncome
                              ? AppColors.incomeColor.withAlpha(40)
                              : AppColors.expenseColor.withAlpha(30),
                          width: 0.8.w,
                        ),
                      ),

                      child: Row(
                        children: [
                          SvgPicture.asset(
                            isIncome
                                ? 'assets/icons/income.svg'
                                : 'assets/icons/expense.svg',
                            height: 7.h,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            transaction.type.name,
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
            Row(
              children: [
                SizedBox(
                  width: 64.w,
                  child: Text(
                    AppHelpers.formatNumber(transaction.amount),

                    style: TextStyle(fontSize: 12.5.sp),
                    textAlign: TextAlign.end,
                  ),
                ),
                Text(
                  ' £',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: transaction.type == TransactionType.income
                        ? AppColors.incomeColor
                        : AppColors.expenseColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
