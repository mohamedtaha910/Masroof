import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/data/data_sources/budget_remote_data_source.dart';
import 'package:masroof/features/budget/data/models/budget_model.dart';
import 'package:masroof/features/budget/domain/entities/budget_entity.dart';
import 'package:masroof/features/budget/domain/repos/budget_repo.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/domain/repos/transaction_repo.dart';

class BudgetRepoImpl implements BudgetRepo {
  final BudgetRemoteDataSource remoteDataSource;
    final TransactionRepo transactionRepo;


  BudgetRepoImpl({required this.remoteDataSource, required this.transactionRepo});

  final List<TransactionEntity> allTransactions = [];

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

  @override
  Map<Category, double> getExpensesByCategory({required DateTime month , }) {
    
    final startDate = DateTime(month.year, month.month);
    final endDate = DateTime(month.year, month.month + 1);

    final Map<Category, double> expensesByCategory = {};

    for (final transaction in allTransactions) {
      final isExpense = transaction.type == TransactionType.expense;

      final isInSelectedMonth =
          !transaction.date.isBefore(startDate) &&
          transaction.date.isBefore(endDate);

      if (isExpense && isInSelectedMonth) {
        final category = transaction.category;

        expensesByCategory[category] =
            (expensesByCategory[category] ?? 0) + transaction.amount;
      }
    }

    return expensesByCategory;
  }

  @override
  Future<List<TransactionEntity>> getAllTransactions() async {
     final transactions = await transactionRepo.getTransactions();
    allTransactions.clear();
    allTransactions.addAll(transactions);
    return allTransactions;
  }
}
