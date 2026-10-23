import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class EditTransactionTextFeild extends StatefulWidget {
  const EditTransactionTextFeild({
    super.key,
    this.onChanged,
    required this.maxLines,
    required this.text,
    required this.validate,
  });
  final void Function(String)? onChanged;
  final int maxLines;
  final String text;
  final bool validate;

  @override
  State<EditTransactionTextFeild> createState() =>
      _EditTransactionTextFeildState();
}

class _EditTransactionTextFeildState extends State<EditTransactionTextFeild> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.text.isEmpty ? 'No Note!' : widget.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      validator: (data) {
        if (widget.validate && data!.isEmpty) {
          return 'feild is required';
        } else {
          return null;
        }
      },
      // scrollPadding: EdgeInsets.symmetric(horizontal: 16.w),
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,

      cursorColor: AppColors.tertiaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        // fillColor: Colors.grey.withAlpha(20),
        fillColor: Colors.white.withAlpha(10),
        filled: true,
        // prefix: Icon(Icons.attach_money, color: Colors.black54, size: 40.sp),
        // hint: Text(
        //   '',
        //   style: TextStyle(color: Colors.black38, fontSize: 12.sp),
        //   // textAlign: TextAlign.center,
        // ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
