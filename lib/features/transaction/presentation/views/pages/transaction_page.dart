import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_item.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('All Transactions', style: TextStyle(fontSize: 18.sp)),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 100),
            physics: BouncingScrollPhysics(),
            itemCount: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: TransactionItem(index: index),
              );
            },
          ),
          Positioned(
            child: Container(
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withAlpha(255),
                    Colors.white.withAlpha(235),
                    Colors.white.withAlpha(215),
                    Colors.white.withAlpha(190),
                    Colors.white.withAlpha(120),
                    Colors.white.withAlpha(20),
                    Colors.white.withAlpha(10),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
