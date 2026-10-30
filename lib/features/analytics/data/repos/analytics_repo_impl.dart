import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';
import 'package:masroof/features/analytics/domain/repos/analytics_repo.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/domain/repos/transaction_repo.dart';

class AnalyticsRepoImpl implements AnalyticsRepo {
  final TransactionRepo transactionRepo;

  AnalyticsRepoImpl({required this.transactionRepo});

  @override
  Future<AnalyticsEntity> getAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final allTransactions = await transactionRepo.getTransactions();

    final transactions = allTransactions.where((transaction) {
      return !transaction.date.isBefore(startDate) &&
          transaction.date.isBefore(endDate);
    }).toList();

    double totalIncome = 0;
    double totalExpenses = 0;

    final Map<Category, double> expensesByCategory = {};
    final Map<Category, double> incomeByCategory = {};

    for (final transaction in transactions) {
      final category = transaction.category;

      if (transaction.type == TransactionType.income) {
        totalIncome += transaction.amount;

        incomeByCategory[category] =
            (incomeByCategory[category] ?? 0) + transaction.amount;
      } else {
        totalExpenses += transaction.amount;

        expensesByCategory[category] =
            (expensesByCategory[category] ?? 0) + transaction.amount;
      }
    }

    return AnalyticsEntity(
      totalIncome: totalIncome,
      totalExpenses: totalExpenses,
      netSavings: totalIncome - totalExpenses,
      expensesByCategory: expensesByCategory,
      incomeByCategory: incomeByCategory,
      transactions: transactions,
    );
  }
}
