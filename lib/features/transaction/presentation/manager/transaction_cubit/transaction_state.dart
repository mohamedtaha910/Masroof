
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

abstract class TransactionsState {
  const TransactionsState();
}

class TransactionsInitial extends TransactionsState {
  const TransactionsInitial();
}

class TransactionsLoading extends TransactionsState {
  const TransactionsLoading();
}

class TransactionsLoaded extends TransactionsState {
  final List<TransactionEntity> transactions;

  const TransactionsLoaded(this.transactions);
}

class TransactionsError extends TransactionsState {
  final String message;

  const TransactionsError(this.message);
}

class TransactionAdded extends TransactionsState {
  final String id;

  const TransactionAdded(this.id);
}

class TransactionDeleted extends TransactionsState {
  const TransactionDeleted();
}
