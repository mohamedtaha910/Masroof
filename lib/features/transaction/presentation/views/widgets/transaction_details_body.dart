import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_details_header.dart';

class TransactionDetailsBoby extends StatelessWidget {
  const TransactionDetailsBoby({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
