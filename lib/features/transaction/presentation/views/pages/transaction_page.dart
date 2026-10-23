import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:masroof/features/auth/presentation/views/widgets/show_auth_error_message.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_builder.dart';
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
          TransactionBlocBuilder(),
          Positioned(
            child: Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withAlpha(255),
                    Colors.white.withAlpha(245),
                    Colors.white.withAlpha(235),
                    Colors.white.withAlpha(220),
                    Colors.white.withAlpha(200),
                    Colors.white.withAlpha(120),
                    Colors.white.withAlpha(20),
                    Colors.white.withAlpha(0),
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
