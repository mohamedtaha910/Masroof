import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_item.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({super.key, required this.recentTransaction});
  final List<TransactionEntity> recentTransaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.w, left: 14.w, bottom: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 2.h,
          //   width: MediaQuery.of(context).size.width * 0.7,
          //   decoration: BoxDecoration(color: Colors.black38),
          // ),
          Text('Recent transaction', style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 10.h),
          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recentTransaction.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TransactionItem(
                  index: index,
                  transaction: recentTransaction[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
