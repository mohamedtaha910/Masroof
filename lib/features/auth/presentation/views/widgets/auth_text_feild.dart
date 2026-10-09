import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class AuthTextFeild extends StatefulWidget {
  const AuthTextFeild({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.borderRadius,
    required this.obscureText,
    this.paddign = 16,
    this.height = 12,
  });
  final String hintText;
  final IconData icon;
  final void Function(String)? onChanged;
  final double borderRadius;
  final bool obscureText;
  final double paddign;
  final double? height;

  @override
  State<AuthTextFeild> createState() => _AuthTextFeildState();
}

class _AuthTextFeildState extends State<AuthTextFeild> {
  late bool isHidden;
  @override
  void initState() {
    isHidden = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.paddign),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'feild is required';
          } else if (widget.hintText == 'Password' && data.length < 6) {
            return 'password must be at least 6 characters';
          } else {
            return null;
          }
        },
        scrollPadding: EdgeInsets.symmetric(horizontal: 16.w),
        onChanged: widget.onChanged,
        obscureText: isHidden,

        cursorColor: AppColors.secondaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.height!.h,
            horizontal: 16.w,
          ),
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
            child: Icon(
              isHidden ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),

          // fillColor: Colors.grey.withAlpha(20),
          fillColor: Colors.grey.shade50.withAlpha(100),
          filled: true,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.black54, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                widget.hintText,
                style: TextStyle(color: Colors.black54, fontSize: 12.sp),
              ),
            ],
          ),

          // border: OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: BorderRadius.circular(widget.borderRadius),
          // ),
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey, width: 0.8),
          //   borderRadius: BorderRadius.circular(widget.borderRadius),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.tertiaryColor.withAlpha(200),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withAlpha(80),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.w),
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
        ),
      ),
    );
  }
}
