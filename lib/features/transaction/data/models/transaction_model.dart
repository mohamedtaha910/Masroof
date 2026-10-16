import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.id,
    required super.title,
    required super.amount,
    required super.type,
    required super.category,
    required super.date,
    super.note,
  });

  factory TransactionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;

    return TransactionModel(
      id: snapshot.id,
      title: data['title'] as String,
      amount: (data['amount'] as num).toDouble(),
      type: TransactionType.values.byName(data['type'] as String),
      category: Category(name: data['categoryName'] as String, iconPath: ''),
      date: (data['date'] as Timestamp).toDate(),
      note: data['note'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'amount': amount,
      'type': type.name,
      'categoryId': category.name.toLowerCase(),
      'categoryName': category.name,
      'date': Timestamp.fromDate(date),
      'note': note,
    };
  }
}
