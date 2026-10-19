import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<String> addTransaction(TransactionModel transaction);

  Future<List<TransactionModel>> getTransactions();

  Future<void> updateTransaction(TransactionModel transaction);

  Future<void> deleteTransaction(String transactionId);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  TransactionRemoteDataSourceImpl({
    required this.firestore,
    required this.auth,
  });

  CollectionReference<Map<String, dynamic>> get _transactionsCollection {
    final user = auth.currentUser;

    if (user == null) {
      throw FirebaseAuthException(
        code: 'unauthenticated',
        message: 'User must be logged in.',
      );
    }

    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('transactions');
  }

  @override
  Future<String> addTransaction(TransactionModel transaction) async {
    
    final docRef = await _transactionsCollection.add(transaction.toFirestore());

    return docRef.id;
    // await _transactionsCollection
    //     .doc(transaction.id)
    //     .set(transaction.toFirestore());
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final snapshot = await _transactionsCollection
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => TransactionModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    final id = transaction.id;

    if (id == null) {
      throw ArgumentError('Transaction ID is required for update.');
    }

    await _transactionsCollection
        .doc(transaction.id)
        .update(transaction.toFirestore());
  }

  @override
  Future<void> deleteTransaction(String transactionId) async {
    
    await _transactionsCollection.doc(transactionId).delete();
  }
}
