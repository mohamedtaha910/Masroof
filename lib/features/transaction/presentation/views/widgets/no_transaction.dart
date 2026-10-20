import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

class NoTransactionPage extends StatelessWidget {
  const NoTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset('assets/icons/no_transactions.svg', height: 120.h),
          // Image.asset('assets/icons/empty_folder.png', height: 135.h),
          // Image.asset('assets/icons/empty_state.png', height: 105.h),
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
            'No Transactions yet',
            style: TextStyle(color: Colors.black54, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
