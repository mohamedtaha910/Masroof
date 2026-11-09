import 'package:masroof/features/budget/domain/entities/budget_entity.dart';

abstract class BudgetRepo {
  Future<String> addBudget({required BudgetEntity budget});

  Future<List<BudgetEntity>> getBudgets({required DateTime month});

  Future<void> updateBudget({required BudgetEntity budget});

  Future<void> deleteBudget({required String budgetId});
}
