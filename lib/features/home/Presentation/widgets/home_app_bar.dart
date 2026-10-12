import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/core/widgets/custom_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBlur(
          radius: 50,
          sigmaX: 10,
          sigmay: 10,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(100),
              border: Border.all(
                color: Colors.grey.shade100.withAlpha(100),
                width: 0.8.w,
              ),
              borderRadius: BorderRadius.circular(50),
              // shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(10),
                  offset: Offset(0, 3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 6.w),
                Image.asset('assets/app_icons/masroof_icon.png', height: 30.h),
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
                        Text('Hi ', style: TextStyle(fontSize: 13)),
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
                SizedBox(width: 16.w),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),

        Spacer(),
        CustomBlur(
          radius: 100,
          sigmaX: 10,
          sigmay: 10,
          child: CustomButton(
            colors: [Colors.white.withAlpha(80), Colors.white.withAlpha(80)],
            border: Border.all(
              color: Colors.grey.shade100.withAlpha(100),
              width: 0.8.w,
            ),
            borderRadius: 200,
            horizontalPadding: 9,
            verticalPadding: 9,
            onTap: () {},
            child: Icon(Iconsax.search_normal_copy, size: 22),
          ),
        ),
        SizedBox(width: 16.w),
        CustomBlur(
          radius: 100,
          sigmaX: 10,
          sigmay: 10,
          child: CustomButton(
            colors: [Colors.white.withAlpha(80), Colors.white.withAlpha(80)],
            border: Border.all(
              color: Colors.grey.shade100.withAlpha(100),
              width: 0.8.w,
            ),
            borderRadius: 200,
            horizontalPadding: 8,
            verticalPadding: 8,
            onTap: () {},

            child: Icon(Iconsax.notification_bing_copy, size: 22),
          ),
        ),
      ],
    );
  }
}
