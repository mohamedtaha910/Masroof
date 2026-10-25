import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_text_feild.dart';

class NoteTextFeild extends StatelessWidget {
  const NoteTextFeild({super.key, required this.onNoteSelected});
  final ValueChanged<String> onNoteSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(180)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Note',
          //   style: TextStyle(color: Colors.black54, fontSize: 12.sp),
          // ),
          SizedBox(height: 4.h),
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
    );
  }
}
