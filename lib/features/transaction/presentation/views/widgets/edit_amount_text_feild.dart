import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class EditAmoutTextFeild extends StatefulWidget {
  const EditAmoutTextFeild({super.key, this.onChanged, required this.amout});
  final void Function(String)? onChanged;
  final String amout;

  @override
  State<EditAmoutTextFeild> createState() => _EditAmoutTextFeildState();
}

class _EditAmoutTextFeildState extends State<EditAmoutTextFeild> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.amout);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textAlign: TextAlign.center,

      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      validator: (data) {
        if (data!.isEmpty) {
          return 'feild is required';
        } else {
          return null;
        }
      },
      // scrollPadding: EdgeInsets.symmetric(horizontal: 16.w),
      onChanged: widget.onChanged,

      cursorColor: AppColors.tertiaryColor,
      decoration: InputDecoration(
        // fillColor: Colors.grey.withAlpha(20),
        fillColor: Colors.white.withAlpha(10),
        filled: true,
        // prefix: Icon(Icons.attach_money, color: Colors.black54, size: 40.sp),
        hint: Text(
          '0.00',
          style: TextStyle(color: Colors.black54, fontSize: 28.sp),
          textAlign: TextAlign.center,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
