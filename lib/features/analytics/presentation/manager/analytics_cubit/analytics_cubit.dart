// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/features/analytics/domain/repos/analytics_repo.dart';
import 'package:masroof/features/analytics/presentation/manager/analytics_cubit/analytics_state.dart';



class AnalyticsCubit extends Cubit<AnalyticsState> {
  final AnalyticsRepo analyticsRepo;

  AnalyticsCubit({required this.analyticsRepo})
    : super(const AnalyticsInitial());

  Future<void> loadAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    emit(const AnalyticsLoading());

    try {
      final analytics = await analyticsRepo.getAnalytics(
        startDate: startDate,
        endDate: endDate,
      );

      emit(AnalyticsSuccess(analytics));
    } catch (e) {
      emit(AnalyticsError(e.toString()));
    }
  }
}
