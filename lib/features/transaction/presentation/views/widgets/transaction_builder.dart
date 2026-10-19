import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:masroof/features/auth/presentation/views/widgets/show_auth_error_message.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/all_transactions_list.dart';

class TransactionBlocBuilder extends StatelessWidget {
  const TransactionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionsError) {
          showAuthErrorMessage(context, message: state.message);
        }
      },
      builder: (context, state) {
        // BlocProvider.of<TransactionsCubit>(context).getTransactions();
        if (state is TransactionsLoading) {
          return Center(child: CustomLoadingIndicator());
        } else if (state is TransactionsLoaded) {
          List<TransactionEntity> transactions =
              BlocProvider.of<TransactionsCubit>(context).transactions;

          return transactions.isEmpty
              ? NoTransactionPage()
              : AllTransactionList(transactions: transactions);
        } else {
          return Text('No Transactions Yet');
        }
      },
    );
  }
}

class NoTransactionPage extends StatelessWidget {
  const NoTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset('assets/icons/no_transactions.svg', height: 120.h),
          // Image.asset('assets/icons/empty_folder.png', height: 135.h),
          // Image.asset('assets/icons/empty_state.png', height: 105.h),
          // Container(
          //   padding: EdgeInsets.all(34.h),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(200.r),
          //     gradient: LinearGradient(
          //       colors: [
          //         AppColors.secondaryColor.withAlpha(140),
          //         AppColors.secondaryColor.withAlpha(180),
          //         AppColors.secondaryColor.withAlpha(225),
          //       ],
          //       begin: AlignmentGeometry.topCenter,
          //       end: AlignmentGeometry.bottomCenter,
          //     ),
          //   ),
          //   child: Image.asset('assets/icons/folder_error.png', height: 90.h),
          // ),
          SizedBox(height: 28.h),
          Text(
            'No Transactions yet',
            style: TextStyle(color: Colors.black54, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
