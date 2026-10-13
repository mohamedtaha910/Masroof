// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/core/widgets/custom_glass.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomGlass(
          child: CustomBlur(
            radius: 100,
            sigmaX: 3,
            sigmay: 3,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              decoration: BoxDecoration(
                // color: Colors.white.withAlpha(100),
                // border: Border.all(
                //   color: Colors.grey.shade100.withAlpha(100),
                //   width: 0.8.w,
                // ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withAlpha(130),
                    Colors.white.withAlpha(110),
                    Colors.white.withAlpha(70),
                  ],
                  begin: AlignmentGeometry.topRight,
                  end: AlignmentGeometry.bottomRight,
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withAlpha(90),
                    width: 0.9.w,
                  ),
                  bottom: BorderSide(
                    color: Colors.white.withAlpha(90),
                    width: 0.9.w,
                  ),
                ),
                borderRadius: BorderRadius.circular(50),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    offset: Offset(4, 4),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 6.w),
                  Image.asset(
                    'assets/app_icons/masroof_icon.png',
                    height: 30.h,
                  ),
                  SizedBox(width: 8.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/app_icons/Masroof.svg',
                        height: 9.5.h,
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text('Hi ', style: TextStyle(fontSize: 12.sp)),
                          Text(
                            name ?? 'Unknown',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.tertiaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            ),
          ),
        ),

        // SizedBox(width: 8.w),
        Spacer(),
        CustomGlass(
          child: CustomBlur(
            radius: 100,
            sigmaX: 3,
            sigmay: 3,
            child: CustomButton(
              // colors: [Colors.white.withAlpha(80), Colors.white.withAlpha(80)],
              colors: [
                Colors.white.withAlpha(130),
                Colors.white.withAlpha(100),
                Colors.white.withAlpha(70),
              ],
              // border: Border.all(
              //   color: Colors.grey.shade100.withAlpha(100),
              //   width: 0.8.w,
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  offset: Offset(4, 4),
                  blurRadius: 24,
                ),
              ],
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 1.2.w,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 1.2.w,
                ),
                right: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 0.1.w,
                ),
                left: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 0.1.w,
                ),
              ),
              borderRadius: 200,
              horizontalPadding: 11,
              verticalPadding: 9,
              onTap: () {},
              child: Icon(Iconsax.search_normal_copy, size: 18.h),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        // Spacer(),
        CustomGlass(
          child: CustomBlur(
            radius: 100,
            sigmaX: 3,
            sigmay: 3,
            child: CustomButton(
              colors: [
                Colors.white.withAlpha(150),
                Colors.white.withAlpha(110),
                Colors.white.withAlpha(70),
              ],
              // border: Border.all(
              //   color: Colors.grey.shade100.withAlpha(100),
              //   width: 0.8.w,
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  offset: Offset(4, 4),
                  blurRadius: 24,
                ),
              ],
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 1.2.w,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 1.2.w,
                ),
                right: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 0.1.w,
                ),
                left: BorderSide(
                  color: Colors.grey.shade100.withAlpha(80),
                  width: 0.1.w,
                ),
              ),
              borderRadius: 200,
              horizontalPadding: 10,
              verticalPadding: 8,
              onTap: () {},

              child: Icon(Iconsax.notification_bing_copy, size: 18.h),
            ),
          ),
        ),
      ],
    );
  }
}
