import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/domain/repos/transaction_repo.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionRepo transactionRepo;

  TransactionsCubit({required this.transactionRepo})
    : super(const TransactionsInitial());

  List<TransactionEntity> transactions = [];

  Future<void> getTransactions() async {
    emit(const TransactionsLoading());

    try {
      transactions = await transactionRepo.getTransactions();

      emit(TransactionsLoaded(transactions));
    } catch (e) {
      emit(TransactionsError(e.toString()));
    }
  }

  Future<void> addTransaction({required TransactionEntity transaction}) async {
    emit(TransactionsLoading());
    try {
      final id = await transactionRepo.addTransaction(transaction: transaction);

      final savedTransaction = TransactionEntity(
        id: id,
        title: transaction.title,
        amount: transaction.amount,
        type: transaction.type,
        category: transaction.category,
        date: transaction.date,
        note: transaction.note,
      );
      getTransactions();
      // transactions = [savedTransaction, ...transactions];
      // transactions.add(savedTransaction);
      emit(TransactionAdded(id));
    } catch (e) {
      emit(TransactionsError(e.toString()));
    }
  }

  Future<void> deleteTransaction({required String transactionId}) async {
    emit(const TransactionsLoading());
    try {
      await transactionRepo.deleteTransaction(transactionId: transactionId);

      // transactions = transactions
      //     .where((transaction) => transaction.id != transactionId)
      //     .toList();

      getTransactions();

      // emit(TransactionsLoaded(transactions));
    } catch (e) {
      emit(TransactionsError(e.toString()));
    }
  }

Future<void> updateTransaction({
    required TransactionEntity transaction,
  }) async {
    try {
      await transactionRepo.updateTransaction(
        transaction: transaction,
      );

      transactions = transactions.map((item) {
        return item.id == transaction.id ? transaction : item;
      }).toList();

      emit(TransactionsLoaded(transactions));
    } catch (e) {
      emit(TransactionsError(e.toString()));
    }
  }


}
