import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:masroof/features/budget/data/data_sources/budget_remote_data_source.dart';
import 'package:masroof/features/budget/data/models/budget_model.dart';

class BudgetRemoteDataSourceImpl implements BudgetRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  BudgetRemoteDataSourceImpl({required this.firestore, required this.auth});

  CollectionReference<Map<String, dynamic>> get _budgetsCollection =>
      firestore.collection('users').doc(_userId).collection('budgets');

  String get _userId {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('User is not authenticated');
    }

    return user.uid;
  }

  String _generateBudgetId(BudgetModel budget) {
    final month = budget.month;

    final categoryName = budget.category.name.toLowerCase().replaceAll(
      ' ',
      '_',
    );

    return '${month.year}_${month.month}_$categoryName';
  }

  @override
  Future<String> addBudget({required BudgetModel budget}) async {
    final budgetId = _generateBudgetId(budget);

    await _budgetsCollection.doc(budgetId).set(budget.toFirestore());

    return budgetId;
  }

  @override
  Future<List<BudgetModel>> getBudgets({required DateTime month}) async {
    final selectedMonth = DateTime(month.year, month.month);

    final snapshot = await _budgetsCollection
        .where('month', isEqualTo: Timestamp.fromDate(selectedMonth))
        .get();

    return snapshot.docs.map((doc) => BudgetModel.fromFirestore(doc)).toList();
  }

  @override
  Future<void> updateBudget({required BudgetModel budget}) async {
    if (budget.id == null) {
      throw ArgumentError('Budget ID cannot be null');
    }

    await _budgetsCollection.doc(budget.id).update({
      ...budget.toFirestore(),
      'userId': _userId,
    });
  }

  @override
  @override
  Future<void> deleteBudget({required String budgetId}) async {
    await _budgetsCollection.doc(budgetId).delete();
  }
  
}
