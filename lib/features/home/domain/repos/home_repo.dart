import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

abstract class HomeRepo {
  Future<void> getAllTransaction();
  List<TransactionEntity> getRecentTransactions();
  double getTotalBalance();
  double getTotalIncome();
  double getTotalExpense();
  double getTodayIncome();
  double getTodayExpense();
}
