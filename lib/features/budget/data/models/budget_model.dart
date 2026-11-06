import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/budget/domain/budget_entity.dart';

class BudgetModel extends BudgetEntity {
  const BudgetModel({
    super.id,
    required super.category,
    required super.limit,
    required super.month,
  });

  factory BudgetModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;

    final categoryName = data['categoryName'] as String;

    final category = AppCategories.expenses.firstWhere(
      (category) => category.name == categoryName,
      orElse: () => AppCategories.other,
    );

    return BudgetModel(
      id: doc.id,
      category: category,
      limit: (data['limit'] as num).toDouble(),
      month: (data['month'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'categoryName': category.name,
      'limit': limit,
      'month': Timestamp.fromDate(DateTime(month.year, month.month)),
    };
  }
}
