import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_text_feild.dart';

class EditTransactionTitle extends StatelessWidget {
  const EditTransactionTitle({
    super.key,
    required this.title,
    required this.onTextChanged,
  });
  final String title;
  final ValueChanged<String> onTextChanged;

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
          Text(
            'Title',
            style: TextStyle(color: Colors.black54, fontSize: 12.sp),
          ),
          EditTransactionTextFeild(
            maxLines: 1,
            text: title,
            validate: true,
            onChanged: (value) {
              onTextChanged(value);
            },
          ),

          // SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
