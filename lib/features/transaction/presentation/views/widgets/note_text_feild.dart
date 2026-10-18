import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_text_feild.dart';

class NoteTextFeild extends StatelessWidget {
  const NoteTextFeild({super.key, required this.onNoteSelected});
  final ValueChanged<String> onNoteSelected;

  @override
  Widget build(BuildContext context) {
    return CustomGlass(
      radius: 14,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        color: Colors.white.withAlpha(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Note', style: TextStyle(color: Colors.black54)),
            TransactionTextFeild(
              validate: false,
              maxLines: 5,
              hint: 'Add a Note (Optional)',
              onChanged: (value) {
                onNoteSelected(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
