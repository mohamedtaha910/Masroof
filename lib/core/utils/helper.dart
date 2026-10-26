import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:intl/intl.dart';

class AppHelpers {
  AppHelpers._();

  static bool isToday(DateTime date) {
    final now = DateTime.now();

    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static bool isYesterday(DateTime date) {
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  static void sortTransactions(List<TransactionEntity> transactions) {
    transactions.sort((a, b) => b.date.compareTo(a.date));
  }

  static String formatNumber(double number) {
    return NumberFormat('#,##0.0').format(number);
  }
}
