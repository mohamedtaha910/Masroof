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
import 'package:masroof/features/transaction/presentation/views/widgets/no_transaction.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transactions_shimmer_list.dart';

class TransactionBlocBuilder extends StatelessWidget {
  const TransactionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionsError) {
          showErrorMessage(context, message: state.message);
        }
      },
      builder: (context, state) {
        // BlocProvider.of<TransactionsCubit>(context).getTransactions();
        if (state is TransactionsLoading) {
          return TransactionsShimmerList();
        }
        // else if (state is TransactionsError) {
        //   return NoTransactionPage(text: 'Some Thing went Wrong');
        // }
        else {
          List<TransactionEntity> transactions =
              BlocProvider.of<TransactionsCubit>(context).transactions;

          return transactions.isEmpty
              ? NoTransactionPage()
              : AllTransactionList(transactions: transactions);
        }
      },
    );
  }
}
