import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/info_row.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_details_body.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({
    super.key,
    required this.date,
    required this.type,
    required this.category,
  });
  final DateTime date;
  final TransactionType type;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(180)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            label: 'DATE',
            body: DateFormat('MMMM dd, yyyy , hh:mm a').format(date),
            // icon: Icon(Iconsax.calendar_1, color: Colors.orange, size: 18.h),
            icon: Image.asset('assets/icons/calendar.png', height: 20.h),
            color: Colors.orange.withAlpha(50),
          ),
          SizedBox(height: 16.h),
          Horizintalline(),
          SizedBox(height: 16.h),
          InfoRow(
            label: 'TYPE',
            body: type.name,
            
            icon: Image.asset(
              type == TransactionType.income
                  ? 'assets/icons/income00.png'
                  : 'assets/icons/expense2.png',
              height: 20.h,
            ),
            color: type == TransactionType.income
                ? AppColors.incomeColor.withAlpha(80)
                : AppColors.expenseColor.withAlpha(80),
          ),
          SizedBox(height: 16.h),
          Horizintalline(),
          SizedBox(height: 16.h),
          InfoRow(
            label: 'CATEGORY',
            body: category.name,
            // icon: Icon(Iconsax.category, color: Colors.blue, size: 18.h),
            icon: Image.asset('assets/icons/category.png', height: 20.h),
            color: Colors.blue.withAlpha(50),
          ),
        ],
      ),
    );
  }
}

class Horizintalline extends StatelessWidget {
  const Horizintalline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 1.h,
        width: 250.w,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
