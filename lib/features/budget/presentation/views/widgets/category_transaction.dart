import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/no_transaction.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_item.dart';

class CategoryTransaction extends StatelessWidget {
  const CategoryTransaction({super.key, required this.transactions});
  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 28.h),
            child: NoTransactionPage(
              text: 'No recent transactions',
              imageHeight: 70,
              imagePadding: 32,
              textSize: 12,
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TransactionItem(
                  index: index,
                  transaction: transactions[index],
                ),
              );
            },
          );
  }
}
