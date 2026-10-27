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

    final Map<String, double> expensesByCategory = {};
    final Map<String, double> incomeByCategory = {};

    for (final transaction in transactions) {
      final categoryName = transaction.category.name;

      if (transaction.type == TransactionType.income) {
        totalIncome += transaction.amount;

        incomeByCategory[categoryName] =
            (incomeByCategory[categoryName] ?? 0) + transaction.amount;
      } else {
        totalExpenses += transaction.amount;

        expensesByCategory[categoryName] =
            (expensesByCategory[categoryName] ?? 0) + transaction.amount;
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
