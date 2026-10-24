import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_item.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
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
            itemCount: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                // child: TransactionItem(index: index, transaction: []),
              );
            },
          ),
        ],
      ),
    );
  }
}
