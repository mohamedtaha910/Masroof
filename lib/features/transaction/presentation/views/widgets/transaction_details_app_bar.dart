import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/confirm_delete_transaction.dart';

class TransactionDeatilsAppBar extends StatelessWidget {
  const TransactionDeatilsAppBar({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withAlpha(200),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey.shade300.withAlpha(180)),
            ),
            child: Icon(Icons.chevron_left_rounded, size: 24.sp),
          ),
        ),
        Spacer(),
        Text('Transaction Details', style: TextStyle(fontSize: 16.sp)),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withAlpha(200),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey.shade300.withAlpha(180)),
            ),
            child: Icon(Iconsax.receipt_edit_copy, size: 20.sp),
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            confirmDeleteTransaction(context , transaction: transaction );
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withAlpha(200),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey.shade300.withAlpha(180)),
            ),
            child: Icon(
              Iconsax.trash_copy,
              size: 20.sp,
              color: AppColors.expenseColor,
            ),
          ),
        ),

        // SizedBox(width: 24.w),
      ],
    );
  }
}
