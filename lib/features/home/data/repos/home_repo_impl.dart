// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/home/domain/repos/home_repo.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/domain/repos/transaction_repo.dart';
// import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';

class HomeRepoImpl implements HomeRepo {
  final TransactionRepo transactionRepo;

  HomeRepoImpl({required this.transactionRepo});

  Future<List<TransactionEntity>> _getallTransactions() {
    return transactionRepo.getTransactions();
  }
  // final transactions = BlocProvider.of<TransactionsCubit>(context).transactions;

  @override
  Future<List<TransactionEntity>> getRecentTransactions() async {
    final transactions = await _getallTransactions();

    // transactions.sort((a, b) => b.date.compareTo(a.date));

    return transactions.take(6).toList();
  }

  @override
  Future<double> getTotalIncome() async {
    final transactions = await _getallTransactions();

    return transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
  }

  @override
  Future<double> getTotalExpense() async {
    final transactions = await _getallTransactions();

    return transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);
  }

  @override
  Future<double> getTotalBalance() async {
    final income = await getTotalIncome();
    final expense = await getTotalExpense();

    return income - expense;
  }

  @override
  Future<double> getTodayIncome() async {
    final transactions = await _getallTransactions();
    final now = DateTime.now();

    return transactions
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
  Future<double> getTodayExpense() async {
    final transactions = await _getallTransactions();
    final now = DateTime.now();

    return transactions
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
