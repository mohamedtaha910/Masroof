import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class AnalyticsEntity {
  final double totalIncome;
  final double totalExpenses;
  final double netSavings;
  final Map<Category, double> expensesByCategory;
  final Map<Category, double> incomeByCategory;
  final List<TransactionEntity> transactions;
  // ==============================
  final double averageDailySpending;
  final TransactionEntity largestExpenseTransaction;
  final Category? topExpenseCategory;
  final double savingsRate;
  // final double? expenseChangePercentage;

  const AnalyticsEntity({
    required this.totalIncome,
    required this.totalExpenses,
    required this.netSavings,
    required this.expensesByCategory,
    required this.incomeByCategory,
    required this.transactions,
    required this.averageDailySpending,
    required this.largestExpenseTransaction,
    this.topExpenseCategory,
    required this.savingsRate,
    // this.expenseChangePercentage,
  });
}
