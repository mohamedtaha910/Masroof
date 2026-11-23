import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';

class PopUpMenuButton extends StatelessWidget {
  const PopUpMenuButton({
    super.key,
    required this.onSetBudget,
    required this.onDeleteBudget, required this.onBudgetInfo,
  });
  final VoidCallback onSetBudget;
  final VoidCallback onDeleteBudget;
  final VoidCallback onBudgetInfo;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      // padding: EdgeInsetsGeometry.all(0),
      menuPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 1),
      // shadowColor: Colors.white,
      // color: Colors.white.withAlpha(220)
      color: AppColors.neutralColor.withAlpha(245),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withAlpha(180)),
      ),
      // popUpAnimationStyle: AnimationStyle(curve: ElasticInOutCurve()),
      position: PopupMenuPosition.under,
      // borderRadius: BorderRadius.circular(8),
      icon: Icon(Icons.more_vert, size: 18.h),
      onSelected: (value) {
        if (value == 'Edit') {
          onSetBudget();
        } else if (value == 'Delete') {
          onDeleteBudget();
        }else if(value == 'Info'){
          onBudgetInfo();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'Info',
          child: Row(
            children: [
              // SizedBox(width: 6.w),
              Icon(Iconsax.info_circle_copy),
              SizedBox(width: 10),
              Text('Info'),
              // SizedBox(width: 6.w),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Edit',
          child: Row(
            children: [
              // SizedBox(width: 6.w),
              Icon(Iconsax.receipt_edit_copy),
              SizedBox(width: 10),
              Text('Edit'),
              // SizedBox(width: 6.w),
            ],
          ),
        ),

        PopupMenuItem(
          value: 'Delete',
          child: Row(
            children: [
              // SizedBox(width: 6.w),
              Icon(Iconsax.trash_copy, color: Colors.red.withAlpha(200)),
              SizedBox(width: 10),
              Text(
                'Delete',
                style: TextStyle(color: Colors.red.withAlpha(200)),
              ),
              // SizedBox(width: 6.w),
            ],
          ),
        ),
      ],
    );
  }
}
