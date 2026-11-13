import 'package:masroof/features/budget/domain/entities/budget_entity.dart';

abstract class BudgetsState {}

class BudgetsInitial extends BudgetsState {}

class BudgetsLoading extends BudgetsState {}

class BudgetsSuccess extends BudgetsState {
  final List<BudgetEntity> budgets;

  BudgetsSuccess({required this.budgets});
}

class BudgetsError extends BudgetsState {
  final String message;

  BudgetsError({required this.message});
}

class BudgetOperationLoading extends BudgetsState {}

class BudgetOperationSuccess extends BudgetsState {}

class BudgetOperationError extends BudgetsState {
  final String message;

  BudgetOperationError({required this.message});
}






// import 'package:masroof/features/budget/domain/entities/budget_entity.dart';

// enum BudgetsStatus { initial, loading, success, failure }

// class BudgetsState {
//   final List<BudgetEntity> budgets;
//   final BudgetsStatus status;
//   final bool isProcessing;
//   final String? errorMessage;

//   const BudgetsState({
//     this.budgets = const [],
//     this.status = BudgetsStatus.initial,
//     this.isProcessing = false,
//     this.errorMessage,
//   });

//   BudgetsState copyWith({
//     List<BudgetEntity>? budgets,
//     BudgetsStatus? status,
//     bool? isProcessing,
//     String? errorMessage,
//   }) {
//     return BudgetsState(
//       budgets: budgets ?? this.budgets,
//       status: status ?? this.status,
//       isProcessing: isProcessing ?? this.isProcessing,
//       errorMessage: errorMessage,
//     );
//   }
// }
