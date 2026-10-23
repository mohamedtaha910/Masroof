import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.body,
    required this.icon,
    required this.color,
  });
  final String label;
  final String body;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(9.w),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: color.withAlpha(10)),
          ),
          child: icon,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 11.sp, color: Colors.black38),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 220.w,
              child: body.isNotEmpty
                  ? Text(
                      body,
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    )
                  : Text(
                      'N/A',
                      style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                    ),
            ),
          ],
        ),
        // Spacer(),
        // Icon(Icons),
      ],
    );
  }
}
