import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';

abstract class AnalyticsState {
  const AnalyticsState();
}

class AnalyticsInitial extends AnalyticsState {
  const AnalyticsInitial();
}

class AnalyticsLoading extends AnalyticsState {
  const AnalyticsLoading();
}

class AnalyticsSuccess extends AnalyticsState {
  final AnalyticsEntity analytics;

  const AnalyticsSuccess(this.analytics);
}

class AnalyticsError extends AnalyticsState {
  final String message;

  const AnalyticsError(this.message);
}
