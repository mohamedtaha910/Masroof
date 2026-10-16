import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

import '../../domain/repos/transaction_repo.dart';
import '../data_sources/transaction_remote_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepoImpl implements TransactionRepo {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepoImpl({required this.remoteDataSource});

  @override
  Future<String> addTransaction({required TransactionEntity transaction}) {
    final model = TransactionModel(
      id: transaction.id,
      title: transaction.title,
      amount: transaction.amount,
      type: transaction.type,
      category: transaction.category,
      date: transaction.date,
      note: transaction.note,
    );

    return remoteDataSource.addTransaction(model);
  }

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    return await remoteDataSource.getTransactions();
  }

  @override
  Future<void> updateTransaction({required TransactionEntity transaction}) {
    final model = TransactionModel(
      id: transaction.id,
      title: transaction.title,
      amount: transaction.amount,
      type: transaction.type,
      category: transaction.category,
      date: transaction.date,
      note: transaction.note,
    );

    return remoteDataSource.updateTransaction(model);
  }

  @override
  Future<void> deleteTransaction({required String transactionId}) {
    return remoteDataSource.deleteTransaction(transactionId);
  }
}
