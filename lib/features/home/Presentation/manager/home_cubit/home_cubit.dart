import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/home/domain/entities/home_summary_entity.dart';
import 'package:masroof/features/home/domain/repos/home_repo.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  Future<void> getHomeSummary() async {
    emit(HomeLoading());

    try {
      await homeRepo.getAllTransaction();
      final results = ([
        homeRepo.getRecentTransactions(),
        homeRepo.getTotalBalance(),
        homeRepo.getTotalIncome(),
        homeRepo.getTotalExpense(),
        homeRepo.getTodayIncome(),
        homeRepo.getTodayExpense(),
      ]);

      final summary = HomeSummaryEntity(
        recentTransactions: results[0] as List<TransactionEntity>,
        totalBalance: results[1] as double,
        totalIncome: results[2] as double,
        totalExpense: results[3] as double,
        todayIncome: results[4] as double,
        todayExpense: results[5] as double,
      );

      emit(HomeSuccess(summaryEntity: summary));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

// ============================================================================

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:masroof/features/home/domain/entities/home_summary_entity.dart';
// import 'package:masroof/features/home/domain/repos/home_repo.dart';
// import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo homeRepo;

//   HomeCubit(super.initialState, {required this.homeRepo});

//   Future<void> getHomeSummary() async {
//     emit(HomeLoading());

//     try {
//       final results = await Future.wait([
//         homeRepo.getRecentTransactions(),
//         homeRepo.getTotalBalance(),
//         homeRepo.getTotalIncome(),
//         homeRepo.getTotalExpense(),
//         homeRepo.getTodayIncome(),
//         homeRepo.getTodayExpense(),
//       ]);

//       final summary = HomeSummaryEntity(
//         recentTransactions: results[0] as List<TransactionEntity>,
//         totalBalance: results[1] as double,
//         totalIncome: results[2] as double,
//         totalExpense: results[3] as double,
//         todayIncome: results[4] as double,
//         todayExpense: results[5] as double,
//       );

//       emit(HomeSuccess(summaryEntity: summary));
//     } catch (e) {
//       emit(HomeError(e.toString()));
//     }
//   }
// }
