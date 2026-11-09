import 'package:masroof/core/utils/categories.dart';

class BudgetEntity {
  final String? id;
  final Category category;
  final double limit;
  final DateTime month;

  const BudgetEntity({
    this.id,
    required this.category,
    required this.limit,
    required this.month,
  });
}
