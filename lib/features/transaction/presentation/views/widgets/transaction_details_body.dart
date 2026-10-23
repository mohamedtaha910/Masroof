import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/info_row.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_details_header.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_info.dart';

class TransactionDetailsBoby extends StatelessWidget {
  const TransactionDetailsBoby({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            TransactionDetailsHeader(
              category: transaction.category,
              title: transaction.title,
              amout: transaction.amount.toString(),
              type: transaction.type,
            ),
            SizedBox(height: 16.h),
            TransactionInfo(
              date: transaction.date,
              type: transaction.type,
              category: transaction.category,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withAlpha(180)),
              ),
              child: InfoRow(
                label: 'NOTE',
                body: transaction.note,
                // icon: Icon(
                //   Iconsax.note_text,
                //   color: AppColors.tertiaryColor.withAlpha(200),
                // ),
                icon: Image.asset('assets/icons/paper.png', height: 20.h),
                color: AppColors.tertiaryColor.withAlpha(30),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
