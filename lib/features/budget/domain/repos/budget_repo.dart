import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

abstract class BudgetRepo {
  Future<List<TransactionEntity>> getAllTransactions();
  Future<String> addBudget({required BudgetEntity budget});

  Future<List<BudgetEntity>> getBudgets({required DateTime month});

  Future<void> updateBudget({required BudgetEntity budget});

  Future<void> deleteBudget({required String budgetId});

  Map<Category, double> getExpensesByCategory({
    required DateTime month,
  });
  double getTotlaBudget();
  double getTotalSpent();

}
