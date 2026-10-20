import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_item.dart';

class AllTransactionList extends StatelessWidget {
  const AllTransactionList({super.key, required this.transactions});
  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 12.w),
      physics: const BouncingScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        final showDateHeader =
            index == 0 ||
            !DateUtils.isSameDay(
              transaction.date,
              transactions[index - 1].date,
            );

        String? dateTitle;

        if (showDateHeader) {
          if (AppHelpers.isToday(transaction.date)) {
            dateTitle = 'Today';
          } else if (AppHelpers.isYesterday(transaction.date)) {
            dateTitle = 'Yesterday';
          } else {
            dateTitle = DateFormat('MMM dd, yyyy').format(transaction.date);
          }
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (dateTitle != null) ...[
                Text(
                  dateTitle,
                  style: TextStyle(fontSize: 11.sp, color: Colors.black54),
                ),
                SizedBox(height: 6.h),
              ],
              TransactionItem(index: index, transaction: transaction),
            ],
          ),
        );
      },
    );
  }
}


