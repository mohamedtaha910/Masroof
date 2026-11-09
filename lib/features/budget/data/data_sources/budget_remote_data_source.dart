import 'package:masroof/features/budget/data/models/budget_model.dart';

abstract class BudgetRemoteDataSource {
  Future<String> addBudget({required BudgetModel budget});

  Future<List<BudgetModel>> getBudgets({required DateTime month});

  Future<void> updateBudget({required BudgetModel budget});

  Future<void> deleteBudget({required String budgetId});
}
