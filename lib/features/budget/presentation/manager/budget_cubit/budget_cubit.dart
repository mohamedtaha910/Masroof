import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/domain/repos/budget_repo.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_state.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class BudgetsCubit extends Cubit<BudgetsState> {
  final BudgetRepo budgetRepo;

  BudgetsCubit({required this.budgetRepo}) : super(BudgetsInitial());

  Future<void> getAllTransaction() async {
    emit(BudgetsLoading());
    try {
      await budgetRepo.getAllTransactions();
      await getBudgets(month: DateTime.now());
    } catch (e) {
      emit(BudgetsError(message: e.toString()));
    }
  }

  Future<void> getBudgets({required DateTime month}) async {
    emit(BudgetsLoading());

    try {
      final budgets = await budgetRepo.getBudgets(month: month);
      final expensesByCategory = budgetRepo.getExpensesByCategory(month: month);
      final totalBudget = budgetRepo.getTotlaBudget();
      final totalSpent = budgetRepo.getTotalSpent();


      emit(
        BudgetsSuccess(
          totalSpent: totalSpent,
          totalBudget: totalBudget,
          budgets: budgets,
          expensesByCategory: expensesByCategory,
        ),
      );
    } catch (e) {
      emit(BudgetsError(message: e.toString()));
    }
  }
  List<TransactionEntity> getTransactionsByCategory({
    required Category category,
    required DateTime month,
  }) {
    return budgetRepo.getTransactionsByCategory(
      category: category,
      month: month,
    );
  }
 

  Future<void> addBudget({required BudgetEntity budget}) async {
    emit(BudgetsLoading());

    try {
      await budgetRepo.addBudget(budget: budget);

      // emit(BudgetSuccess());

      await getBudgets(month: budget.month);
    } catch (e) {
      emit(BudgetsError(message: e.toString()));
    }
  }

  Future<void> updateBudget({required BudgetEntity budget}) async {
    emit(BudgetsLoading());

    try {
      await budgetRepo.updateBudget(budget: budget);

      // emit(BudgetOperationSuccess());

      await getBudgets(month: budget.month);
    } catch (e) {
      emit(BudgetsError(message: e.toString()));
    }
  }

  Future<void> deleteBudget({
    required String budgetId,
    required DateTime month,
  }) async {
    emit(BudgetsLoading());

    try {
      await budgetRepo.deleteBudget(budgetId: budgetId);

      // emit(BudgetOperationSuccess());

      await getBudgets(month: month);
    } catch (e) {
      emit(BudgetsError(message: e.toString()));
    }
  }
}
