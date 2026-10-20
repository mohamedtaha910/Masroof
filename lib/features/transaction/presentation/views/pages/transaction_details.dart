import 'package:flutter/material.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_details_app_bar.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_details_body.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TransactionDeatilsAppBar(),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      body: TransactionDetailsBoby(transaction: transaction),
    );
  }
}
