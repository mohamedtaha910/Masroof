import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_date_picker.dart';

class EditDate extends StatelessWidget {
  const EditDate({super.key, required this.date, required this.onDateChanged});
  final DateTime date;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(180)),
      ),
      child: TransactionDateField(
        onDateSelected: (value) {
          onDateChanged(value);
        },
        initialDate: date,
      ),
    );
  }
}
