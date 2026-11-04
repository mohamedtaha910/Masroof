import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masroof/core/utils/app_colors.dart';

class NoTransactionPage extends StatelessWidget {
  const NoTransactionPage({
    super.key,
    this.text = 'No Transactions yet',
    this.imagePadding = 42,
    this.imageHeight = 85,
    this.textSize = 13,
  });
  final String text;
  final double imagePadding;
  final double imageHeight;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // SvgPicture.asset('assets/icons/no_transactions.svg', height: 120.h),
          // Image.asset('assets/icons/empty_folder.png', height: 135.h),
          Container(
            padding: EdgeInsets.all(imagePadding),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(120),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(120.r)),
            ),
            // child: Image.asset('assets/icons/empty_state.png', height: 100.h),
            child: Image.asset(
              'assets/icons/folder_error.png',
              height: imageHeight.h,
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(34.h),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(200.r),
          //     gradient: LinearGradient(
          //       colors: [
          //         AppColors.secondaryColor.withAlpha(140),
          //         AppColors.secondaryColor.withAlpha(180),
          //         AppColors.secondaryColor.withAlpha(225),
          //       ],
          //       begin: AlignmentGeometry.topCenter,
          //       end: AlignmentGeometry.bottomCenter,
          //     ),
          //   ),
          //   child: Image.asset('assets/icons/folder_error.png', height: 90.h),
          // ),
          SizedBox(height: 28.h),
          Text(
            text,
            style: TextStyle(
              color: AppColors.mutedColor,
              fontSize: textSize.sp,
            ),
          ),
        ],
      ),
    );
  }
}
