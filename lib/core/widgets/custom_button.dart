import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.child,
    required this.borderRadius,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.onTap,
    this.border,
    this.width,
  });

  final Color color;
  final Widget child;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final void Function() onTap;
  final BoxBorder? border;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w,
        // margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.w,
          vertical: verticalPadding.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          // color: color,
          gradient: LinearGradient(
            colors: [color, color.withAlpha(230), color.withAlpha(215)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          border: border,
        ),
        child: child,
      ),
    );
  }
}
