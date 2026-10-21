import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';

void confirmDeleteTransaction(
  BuildContext context, {
  required TransactionEntity transaction,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.primaryColor.withAlpha(150),

        // backgroundColor: const Color.fromARGB(255, 15, 0, 25).withAlpha(150),
        contentPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
          side: BorderSide(color: Colors.white.withAlpha(50), width: 0.9.w),
        ),
        content: CustomBlur(
          radius: 22,
          sigmaX: 60,
          sigmay: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(14.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    // color: Colors.white10,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(90),
                        Colors.white.withAlpha(60),
                        Colors.white.withAlpha(30),
                      ],
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                    ),
                    border: BoxBorder.fromLTRB(
                      right: BorderSide(
                        color: Colors.grey.withAlpha(150),
                        width: 1.w,
                      ),
                      left: BorderSide(
                        color: Colors.grey.withAlpha(150),
                        width: 1.w,
                      ),
                    ),
                  ),
                  // child: Icon(Iconsax.trash, color: Colors.white, size: 36),
                  child: Image.asset('assets/icons/alert1.png', height: 42.h),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Are you sure you want to delete this Transaction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      verticalPadding: 4,
                      colors: [
                        Colors.white.withAlpha(80),
                        Colors.white.withAlpha(50),
                        Colors.white.withAlpha(25),
                      ],
                      borderRadius: 100,
                      horizontalPadding: 26,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.withAlpha(150),
                          width: 1.2.w,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.withAlpha(150),
                          width: 0.4.w,
                        ),
                      ),
                      // width: double.infinity,
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        BlocProvider.of<TransactionsCubit>(
                          context,
                        ).deleteTransaction(transactionId: transaction.id!);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      verticalPadding: 4,
                      colors: [
                        Colors.red.withAlpha(150),
                        Colors.red.withAlpha(200),
                        Colors.red.withAlpha(230),
                      ],
                      borderRadius: 100,
                      horizontalPadding: 26,
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withAlpha(100),
                          width: 1.w,
                        ),
                        bottom: BorderSide(
                          color: Colors.white.withAlpha(100),
                          width: 0.4.w,
                        ),
                      ),
                      // width: double.infinity,
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


