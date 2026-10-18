import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class TransactionTextFeild extends StatelessWidget {
  const TransactionTextFeild({
    super.key,
    this.onChanged,
    required this.maxLines,
    required this.hint,
    this.validate = true,
  });
  final void Function(String)? onChanged;
  final int maxLines;
  final String hint;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: const TextInputType.numberWithOptions(decimal: true),
      // textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      validator: (data) {
        if (validate && data!.isEmpty) {
          return 'feild is required';
        } else {
          return null;
        }
      },
      // scrollPadding: EdgeInsets.symmetric(horizontal: 16.w),
      onChanged: onChanged,
      maxLines: maxLines,

      cursorColor: AppColors.tertiaryColor,
      decoration: InputDecoration(
        // fillColor: Colors.grey.withAlpha(20),
        fillColor: Colors.white.withAlpha(10),
        filled: true,
        // prefix: Icon(Icons.attach_money, color: Colors.black54, size: 40.sp),
        hint: Text(
          hint,
          style: TextStyle(color: Colors.black38, fontSize: 14.sp),
          // textAlign: TextAlign.center,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
