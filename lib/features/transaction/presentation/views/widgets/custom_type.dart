import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';

class CustomType extends StatelessWidget {
  const CustomType({
    super.key,
    required this.type,
    required this.color,
    required this.icon,
    required this.text,
    required this.isSelected,
  });
  final TransactionType type;
  final Color color;
  final String icon;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6.h),
          decoration: BoxDecoration(
            color: isSelected ? color.withAlpha(70) : AppColors.neutralColor,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(
              color: isSelected ? color.withAlpha(50) : Colors.grey.shade400,
            ),
          ),
          child: SvgPicture.asset(icon),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
