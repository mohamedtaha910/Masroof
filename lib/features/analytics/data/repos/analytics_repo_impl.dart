import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';
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
    double averageDailySpending = 0;
    Category topExpenseCategory;
    final int daysNumber = AppHelpers.daysBetween(startDate, endDate);
    TransactionEntity largestTransaction;
    double savingRate;

    List<TransactionEntity> expensesTrnsactions = transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .toList();
    expensesTrnsactions.sort((a, b) => b.amount.compareTo(a.amount));
    largestTransaction = expensesTrnsactions.first;

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
    averageDailySpending = totalExpenses / daysNumber;
    expensesByCategory.entries
        .where((entry) => entry.value > 0)
        .toList()
        .sort((a, b) => b.value.compareTo(a.value));
    topExpenseCategory = expensesByCategory.entries.first.key;
    savingRate = totalIncome == 0
        ? 0
        : (totalIncome - totalExpenses) / totalIncome;

    return AnalyticsEntity(
      totalIncome: totalIncome,
      totalExpenses: totalExpenses,
      netSavings: totalIncome - totalExpenses,
      expensesByCategory: expensesByCategory,
      incomeByCategory: incomeByCategory,
      transactions: transactions,
      averageDailySpending: averageDailySpending,
      topExpenseCategory: topExpenseCategory,
      largestExpenseTransaction: largestTransaction,
      savingsRate: savingRate,
      // expenseChangePercentage: ,
    );
  }
}
