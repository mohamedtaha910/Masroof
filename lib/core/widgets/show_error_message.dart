import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/widgets/custom_button.dart';

void showErrorMessage(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade400, width: 1.2.w),
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(50),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.error, color: Colors.pink, size: 40),
          ),
          SizedBox(height: 24),
          Text(
            message,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          CustomButton(
            onTap: () {
              Navigator.pop(context);
            },
            verticalPadding: 4,
            color: Colors.red,
            borderRadius: 100,
            horizontalPadding: 50,
            // width: double.infinity,
            child: Text(
              'Ok ',
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),

            // isBorder: true,
          ),
        ],
      ),
    ),
  );
}
