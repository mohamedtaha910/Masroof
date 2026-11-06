// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/widgets/custom_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    // debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');
    // debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 9),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),

            border: Border.all(
              color: Colors.grey.shade400.withAlpha(80),
              width: 1.w,
            ),

            borderRadius: BorderRadius.circular(120.r),
          ),
          child: Image.asset(
            'assets/icons/user.png',
            height: 20.h,
            color: AppColors.neutralColor,
          ),
        ),

        SizedBox(width: 2.w),

        Container(
          padding: EdgeInsets.symmetric(vertical: 4.5.h, horizontal: 10.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/app_icons/Masroof.svg', height: 9.h),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text('Hi ', style: TextStyle(fontSize: 11.sp)),
                  Text(
                    name ?? 'There',
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      // color: Colors.white,
                      color: AppColors.neutralColor,
                    ),
                  ),
                  SizedBox(width: 6.w),
                ],
              ),
            ],
          ),
        ),

        Spacer(),

        // CustomGlass(
        // radius: 100,
        // child:
        CustomButton(
          // colors: [Colors.white.withAlpha(80), Colors.white.withAlpha(80)],
          colors: [
            Colors.white.withAlpha(20),
            Colors.white.withAlpha(20),
            Colors.white.withAlpha(20),
            // AppColors.tertiaryColor.withAlpha(80),
            // AppColors.tertiaryColor.withAlpha(50),
          ],

          border: Border(
            top: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 1.w,
            ),
            bottom: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 1.w,
            ),
            right: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 0.4.w,
            ),
            left: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 0.4.w,
            ),
          ),
          borderRadius: 200,
          horizontalPadding: 10,
          verticalPadding: 8,
          onTap: () {},
          child: Icon(
            Iconsax.search_normal_copy,
            size: 18.h,
            color: AppColors.neutralColor,
          ),
        ),
        // ),
        SizedBox(width: 10.w),

        CustomButton(
          colors: [
            Colors.white.withAlpha(20),
            Colors.white.withAlpha(20),
            Colors.white.withAlpha(20),
          ],

          border: Border(
            top: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 1.w,
            ),
            bottom: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 1.w,
            ),
            right: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 0.4.w,
            ),
            left: BorderSide(
              color: Colors.grey.shade400.withAlpha(80),
              width: 0.4.w,
            ),
          ),
          borderRadius: 200,
          horizontalPadding: 9,
          verticalPadding: 7,
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kBudgetsPage);
          },

          child: Icon(
            // Iconsax.notification_bing_copy,
            Icons.speed_rounded,
            size: 19.h,
            // color: Colors.grey.shade400.withAlpha(180),
            color: AppColors.neutralColor,
          ),
        ),
        // ),
      ],
    );
  }
}
