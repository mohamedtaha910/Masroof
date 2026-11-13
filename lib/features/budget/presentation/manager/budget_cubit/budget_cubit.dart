import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/domain/repos/budget_repo.dart';
import 'package:masroof/features/budget/presentation/manager/budget_cubit/budget_state.dart';

class BudgetsCubit extends Cubit<BudgetsState> {
  final BudgetRepo budgetRepo;

  BudgetsCubit({required this.budgetRepo}) : super(BudgetsInitial());
  

  Future<void> getBudgets({required DateTime month}) async {
    emit(BudgetsLoading());

    try {
      final budgets = await budgetRepo.getBudgets(month: month);

      emit(BudgetsSuccess(budgets: budgets));
    } catch (e) {
      emit(BudgetsError(message: e.toString()));
    }
  }

  Future<void> addBudget({required BudgetEntity budget}) async {
    emit(BudgetOperationLoading());

    try {
      await budgetRepo.addBudget(budget: budget);

      emit(BudgetOperationSuccess());

      await getBudgets(month: budget.month);
    } catch (e) {
      emit(BudgetOperationError(message: e.toString()));
    }
  }

  Future<void> updateBudget({required BudgetEntity budget}) async {
    emit(BudgetOperationLoading());

    try {
      await budgetRepo.updateBudget(budget: budget);

      emit(BudgetOperationSuccess());

      await getBudgets(month: budget.month);
    } catch (e) {
      emit(BudgetOperationError(message: e.toString()));
    }
  }

  Future<void> deleteBudget({
    required String budgetId,
    required DateTime month,
  }) async {
    emit(BudgetOperationLoading());

    try {
      await budgetRepo.deleteBudget(budgetId: budgetId);

      emit(BudgetOperationSuccess());

      await getBudgets(month: month);
    } catch (e) {
      emit(BudgetOperationError(message: e.toString()));
    }
  }
}
