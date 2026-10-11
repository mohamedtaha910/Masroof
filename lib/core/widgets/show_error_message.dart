import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';

void showErrorMessage(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.primaryColor.withAlpha(150),

        // backgroundColor: const Color.fromARGB(255, 15, 0, 25).withAlpha(150),
        contentPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
          side: BorderSide(color: Colors.white.withAlpha(50), width: 0.9.w),
        ),
        content: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60.w, sigmaY: 60.h),

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.dg),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      // color: Colors.white10,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withAlpha(90),
                          Colors.white.withAlpha(60),
                          Colors.white.withAlpha(30),
                        ],
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                      border: BoxBorder.fromLTRB(
                        top: BorderSide(
                          color: Colors.grey.withAlpha(150),
                          width: 1.2.w,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey.withAlpha(150),
                          width: 0.4.w,
                        ),
                      ),
                      // border: Border(
                      //   top: BorderSide(
                      //     color: Colors.grey.withAlpha(180),
                      //     width: 1.2.w,
                      //   ),
                      //   bottom: BorderSide(
                      //     color: Colors.grey.withAlpha(180),
                      //     width: 0.4.w,
                      //   ),
                      // ),
                    ),
                    // child: Icon(Icons.error, color: Colors.white, size: 40),
                    child: Image.asset('assets/icons/alert.png', height: 30.h),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
