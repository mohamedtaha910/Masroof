import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/amount_text_feild.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  TransactionType type = TransactionType.income;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.h),
          CustomGlass(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              color: Colors.white.withAlpha(120),
              child: Column(
                children: [
                  Text(
                    'ENTER AMOUNT',
                    style: TextStyle(color: Colors.black54, fontSize: 12.sp),
                  ),

                  SizedBox(height: 16.h),
                  AmountTextFeild(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

