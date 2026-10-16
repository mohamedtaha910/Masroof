import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

abstract class TransactionRepo {
  Future<String> addTransaction({required TransactionEntity transaction});

  Future<List<TransactionEntity>> getTransactions();

  Future<void> updateTransaction({required TransactionEntity transaction});

  Future<void> deleteTransaction({required String transactionId});
}
