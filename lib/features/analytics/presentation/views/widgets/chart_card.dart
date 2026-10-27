import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(150),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D2137).withAlpha(7),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              // color: textColor,
            ),
          ),
          SizedBox(height: 22.h),
          child,
        ],
      ),
    );
  }
}
