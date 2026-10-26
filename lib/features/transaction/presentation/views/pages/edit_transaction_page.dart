import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditTransactionPage extends StatelessWidget {
  const EditTransactionPage({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CustomBlur(
          sigmaX: 12,
          sigmay: 12,
          radius: 0,
          child: AppBar(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(120),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white.withAlpha(200)),
                    ),
                    child: Icon(Icons.chevron_left_rounded, size: 24.sp),
                  ),
                ),
                Spacer(),
                Text('Edit Transaction', style: TextStyle(fontSize: 16.sp)),
                Spacer(),
                SizedBox(width: 24.w),
              ],
            ),

            // centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.neutralColor.withAlpha(120),
            // surfaceTintColor: AppColors.neutralColor,
            // backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 1.h),
              child: Container(
                height: 1.h,
                width: double.infinity,
                color: Colors.white.withAlpha(200),
              ),
            ),
          ),
        ),
      ),

      body: BlocBuilder<TransactionsCubit, TransactionsState>(
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CustomLoadingIndicator(),
            inAsyncCall: state is TransactionsLoading,
            // inAsyncCall: true,
            child: EditTransactionForm(oldTransaction: transaction),
          );
        },
      ),
    );
  }
}
