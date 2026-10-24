import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class HomeSummaryEntity {
  final double totalBalance;
  final double totalIncome;
  final double totalExpense;
  final double todayIncome;
  final double todayExpense;
  final List<TransactionEntity> recentTransactions;

  const HomeSummaryEntity({
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpense,
    required this.todayIncome,
    required this.todayExpense,
    required this.recentTransactions,
  });
}
