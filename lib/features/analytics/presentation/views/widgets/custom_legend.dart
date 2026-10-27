import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';

class CustomLegend extends StatelessWidget {
  const CustomLegend({super.key, required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(color: AppColors.mutedColor, fontSize: 11.sp),
        ),
      ],
    );
  }
}
