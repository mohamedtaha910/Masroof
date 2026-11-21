import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PopUpMenuButton extends StatelessWidget {
  const PopUpMenuButton({super.key, required this.onSetBudget});
  final VoidCallback onSetBudget;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      // padding: EdgeInsetsGeometry.all(0),
      // menuPadding: EdgeInsets.all(0),
      // shadowColor: Colors.white,
      color: Colors.white.withAlpha(220),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white),
      ),
      // popUpAnimationStyle: AnimationStyle(curve: ElasticInOutCurve()),
      position: PopupMenuPosition.under,
      // borderRadius: BorderRadius.circular(8),
      icon: Icon(Icons.more_vert, size: 18.h),
      onSelected: (value) {
        if (value == 'Edit') {
          onSetBudget();
        } else if (value == 'Delete') {
          // Show Delete Confirmation Dialog
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'Edit',
          child: Row(
            children: [
              Icon(Iconsax.receipt_edit_copy),
              SizedBox(width: 10),
              Text('Edit'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'Delete',
          child: Row(
            children: [
              Icon(Iconsax.trash_copy, color: Colors.red),
              SizedBox(width: 8),
              Text('Delete'),
            ],
          ),
        ),
      ],
    );
  }
}
