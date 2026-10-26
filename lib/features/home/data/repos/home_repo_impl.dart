// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/home/domain/repos/home_repo.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/domain/repos/transaction_repo.dart';
// import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';

class HomeRepoImpl implements HomeRepo {
  final TransactionRepo transactionRepo;

  HomeRepoImpl({required this.transactionRepo});

  List<TransactionEntity> allTransactions = [];

  @override
  Future<void> getAllTransaction() async {
    allTransactions = await transactionRepo.getTransactions();
    // return transactionRepo.getTransactions();
  }

  @override
  List<TransactionEntity> getRecentTransactions()  {
    // final transactions = await _getallTransactions();

    // transactions.sort((a, b) => b.date.compareTo(a.date));

    return allTransactions.take(10).toList();
  }

  @override
  double getTotalIncome()  {
    // final transactions = await _getallTransactions();

    return allTransactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
  }

  @override
  double getTotalExpense()  {
    // final transactions = await _getallTransactions();

    return allTransactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
  }

  @override
 double getTotalBalance()  {
    final income =  getTotalIncome();
    final expense =  getTotalExpense();

    return income - expense;
  }

  @override
  double getTodayIncome()  {
    // final transactions = await _getallTransactions();
    final now = DateTime.now();

    return allTransactions
        .where(
          (transaction) =>
              transaction.type == TransactionType.income &&
              transaction.date.year == now.year &&
              transaction.date.month == now.month &&
              transaction.date.day == now.day,
        )
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
  }

  @override
  double getTodayExpense()  {
    // final transactions = await _getallTransactions();
    final now = DateTime.now();

    return allTransactions
        .where(
          (transaction) =>
              transaction.type == TransactionType.expense &&
              transaction.date.year == now.year &&
              transaction.date.month == now.month &&
              transaction.date.day == now.day,
        )
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
  }
}
