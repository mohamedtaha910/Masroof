import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class AnalyticsEntity {
  final double totalIncome;
  final double totalExpenses;
  final double netSavings;
  final Map<Category, double> expensesByCategory;
  final Map<Category, double> incomeByCategory;
  final List<TransactionEntity> transactions;

  const AnalyticsEntity({
    required this.totalIncome,
    required this.totalExpenses,
    required this.netSavings,
    required this.expensesByCategory,
    required this.incomeByCategory,
    required this.transactions,
  });
}
