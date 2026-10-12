import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.colors,
    required this.child,
    required this.borderRadius,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.onTap,
    this.border,
    this.width,
  });

  final List<Color> colors;
  final Widget child;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final void Function() onTap;
  final BoxBorder? border;
  final double? width;

  @override
  Widget build(BuildContext context) {
    List<Color> buttonColors = colors.length == 1
        ? [
            colors.first.withAlpha(215),
            colors.first.withAlpha(230),
            colors.first,
          ]
        : colors;
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
            colors: buttonColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: border,
        ),
        child: child,
      ),
    );
  }
}
