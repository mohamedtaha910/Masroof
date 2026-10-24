part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final HomeSummaryEntity summaryEntity;

  HomeSuccess({required this.summaryEntity});
}

final class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
