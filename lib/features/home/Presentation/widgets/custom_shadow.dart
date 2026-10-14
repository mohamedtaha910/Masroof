import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red,
        gradient: LinearGradient(
          colors: [
            Colors.white.withAlpha(255),
            Colors.white.withAlpha(215),
            Colors.white.withAlpha(200),
            Colors.white.withAlpha(150),
            Colors.white.withAlpha(100),
            Colors.white.withAlpha(50),
            Colors.white.withAlpha(10),
          ],
          end: AlignmentGeometry.topCenter,
          begin: AlignmentGeometry.bottomCenter,
        ),
      ),
    );
  }
}
