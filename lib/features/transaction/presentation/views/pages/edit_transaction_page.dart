import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_form.dart';

class EditTransactionPage extends StatelessWidget {
  const EditTransactionPage({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomGlass(
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withAlpha(200),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey.shade300.withAlpha(180),
                    ),
                  ),
                  child: Icon(Icons.chevron_left_rounded, size: 28.sp),
                ),
              ),
            ),
            Spacer(),
            Text('Edit Transaction', style: TextStyle(fontSize: 16.sp)),
            Spacer(),
            SizedBox(width: 24.w),
          ],
        ),
      ),

      body: EditTransactionForm(oldTransaction: transaction),
    );
  }
}
