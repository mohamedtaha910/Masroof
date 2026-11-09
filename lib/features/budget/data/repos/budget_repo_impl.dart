import 'package:masroof/features/budget/data/data_sources/budget_remote_data_source.dart';
import 'package:masroof/features/budget/data/models/budget_model.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/domain/repos/budget_repo.dart';

class BudgetRepoImpl implements BudgetRepo {
  final BudgetRemoteDataSource remoteDataSource;

  BudgetRepoImpl({required this.remoteDataSource});

  @override
  Future<String> addBudget({required BudgetEntity budget}) async {
    final budgetModel = BudgetModel(
      category: budget.category,
      limit: budget.limit,
      month: DateTime(budget.month.year, budget.month.month),
    );

    return await remoteDataSource.addBudget(budget: budgetModel);
  }

  @override
  Future<List<BudgetEntity>> getBudgets({required DateTime month}) async {
    return await remoteDataSource.getBudgets(
      month: DateTime(month.year, month.month),
    );
  }

  @override
  Future<void> updateBudget({required BudgetEntity budget}) async {
    final budgetModel = BudgetModel(
      id: budget.id,
      category: budget.category,
      limit: budget.limit,
      month: DateTime(budget.month.year, budget.month.month),
    );

    await remoteDataSource.updateBudget(budget: budgetModel);
  }

  @override
  Future<void> deleteBudget({required String budgetId}) async {
    await remoteDataSource.deleteBudget(budgetId: budgetId);
  }
}
