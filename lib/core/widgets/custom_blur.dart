import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomBlur extends StatelessWidget {
  const CustomBlur({
    super.key,
    required this.child,
    required this.radius,
    required this.sigmaX,
    required this.sigmay,
  });
  final Widget child;
  final double radius;
  final double sigmaX;
  final double sigmay;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX.w, sigmaY: sigmay.h),
        child: child,
      ),
    );
  }
}
