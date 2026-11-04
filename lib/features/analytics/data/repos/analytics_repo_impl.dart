import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/utils/helper.dart';
import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';
import 'package:masroof/features/analytics/domain/repos/analytics_repo.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/domain/repos/transaction_repo.dart';

class AnalyticsRepoImpl implements AnalyticsRepo {
  final TransactionRepo transactionRepo;

  AnalyticsRepoImpl({required this.transactionRepo});
  final List<TransactionEntity> allTransactions = [];

  @override
  Future<List<TransactionEntity>> getAllTransactions() async {
    final transactions = await transactionRepo.getTransactions();
    allTransactions.clear();
    allTransactions.addAll(transactions);
    return allTransactions;
  }

  @override
  Future<AnalyticsEntity> getAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // final allTransactions = await transactionRepo.getTransactions();

    final transactions = allTransactions.where((transaction) {
      return !transaction.date.isBefore(startDate) &&
          transaction.date.isBefore(endDate);
    }).toList();

    DateTime prevStartDate = startDate.subtract(
      Duration(days: AppHelpers.daysBetween(startDate, endDate)),
    );
    DateTime prevEndDate = startDate;
    final prevTransactions = allTransactions.where((transaction) {
      return !transaction.date.isBefore(prevStartDate) &&
          transaction.date.isBefore(prevEndDate);
    }).toList();

    double totalIncome = 0;
    double totalExpenses = 0;
    double prevTotalExpenses = 0;

    final Map<Category, double> expensesByCategory = {};
    final Map<Category, double> incomeByCategory = {};
    double averageDailySpending = 0;
    final int daysNumber = AppHelpers.daysBetween(startDate, endDate);
    TransactionEntity largestTransaction;
    double savingRate;
    double expenseChangePercentage = 0;

    List<TransactionEntity> expensesTrnsactions = transactions.isEmpty
        ? []
        : transactions
              .where(
                (transaction) => transaction.type == TransactionType.expense,
              )
              .toList();

    expensesTrnsactions.sort((a, b) => b.amount.compareTo(a.amount));
    largestTransaction = expensesTrnsactions.isNotEmpty
        ? expensesTrnsactions.first
        : TransactionEntity(
            id: '',
            amount: 0,
            date: DateTime.now(),
            type: TransactionType.expense,
            category: AppCategories.other,
            title: '',
            note: '',
          );

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
    for (final transaction in prevTransactions) {
      if (transaction.type == TransactionType.expense) {
        prevTotalExpenses += transaction.amount;
      }
    }
    averageDailySpending = totalExpenses / daysNumber;

    savingRate = totalIncome == 0
        ? 0
        : ((totalIncome - totalExpenses) / totalIncome) * 100;

    expenseChangePercentage = prevTotalExpenses == 0 && totalExpenses == 0
        ? 0
        : prevTotalExpenses == 0
        ? 100
        : ((totalExpenses - prevTotalExpenses) / prevTotalExpenses) * 100;

    return AnalyticsEntity(
      totalIncome: totalIncome,
      totalExpenses: totalExpenses,
      netSavings: totalIncome - totalExpenses,
      expensesByCategory: expensesByCategory,
      incomeByCategory: incomeByCategory,
      transactions: transactions,
      averageDailySpending: averageDailySpending,
      largestExpenseTransaction: largestTransaction,
      savingsRate: savingRate,
      prevTotalExpenses: prevTotalExpenses,
      expenseChangePercentage: expenseChangePercentage,
    );
  }
}
