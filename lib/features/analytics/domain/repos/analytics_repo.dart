import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';

abstract class AnalyticsRepo {
  Future<AnalyticsEntity> getAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  });
}
