import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

abstract class HomeRepo {
  Future<List<TransactionEntity>> getRecentTransactions();
  Future<double> getTotalBalance();
  Future<double> getTotalIncome();
  Future<double> getTotalExpense();
  Future<double> getTodayIncome();
  Future<double> getTodayExpense();
}
