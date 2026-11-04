import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

abstract class AnalyticsRepo {
  Future<List<TransactionEntity>> getAllTransactions();
  Future<AnalyticsEntity> getAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  });
}
