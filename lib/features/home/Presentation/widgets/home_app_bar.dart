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
    // debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');
    // debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(120),
            bottomLeft: Radius.circular(120),
            bottomRight: Radius.circular(2),
            topRight: Radius.circular(2),
          ),
          child: CustomGlass(
            radius: 2,
            child: CustomBlur(
              radius: 2,
              sigmaX: 3,
              sigmay: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 9),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withAlpha(80),
                      Colors.white.withAlpha(60),
                      Colors.white.withAlpha(20),
                      // AppColors.tertiaryColor.withAlpha(80),
                      // AppColors.tertiaryColor.withAlpha(50),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      offset: Offset(4, 4),
                      blurRadius: 24,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade400.withAlpha(80),
                    width: 1.w,
                  ),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(2),
                    topRight: Radius.circular(2),
                  ),
                ),
                child: Image.asset(
                  'assets/icons/user.png',
                  height: 20.h,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 3.w),

        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(120),
            topRight: Radius.circular(120),
          ),
          child: CustomGlass(
            radius: 2,
            child: CustomBlur(
              radius: 2,
              sigmaX: 3,
              sigmay: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.5.h,
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withAlpha(80),
                      Colors.white.withAlpha(60),
                      Colors.white.withAlpha(20),
                      // AppColors.tertiaryColor.withAlpha(80),
                      // AppColors.tertiaryColor.withAlpha(50),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      offset: Offset(4, 4),
                      blurRadius: 24,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade400.withAlpha(80),
                    width: 1.w,
                  ),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(120),
                    topRight: Radius.circular(120),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/app_icons/Masroof.svg',
                      height: 9.h,
                    ),
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
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 6.w),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Spacer(),
        // CustomGlass(
        //   child: CustomBlur(
        //     radius: 100,
        //     sigmaX: 0,
        //     sigmay: 20,
        //     child: Padding(
        //       padding: EdgeInsets.all(9.h),
        //       child: Icon(
        //         Iconsax.search_normal_copy,
        //         size: 18.h,
        //         color: Colors.black.withAlpha(180),
        //       ),
        //     ),
        //   ),
        // ),
        CustomGlass(
          radius: 100,
          child: CustomBlur(
            radius: 100,
            sigmaX: 3,
            sigmay: 3,
            child: CustomButton(
              // colors: [Colors.white.withAlpha(80), Colors.white.withAlpha(80)],
              colors: [
                Colors.white.withAlpha(80),
                Colors.white.withAlpha(60),
                Colors.white.withAlpha(20),
                // AppColors.tertiaryColor.withAlpha(80),
                // AppColors.tertiaryColor.withAlpha(50),
              ],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  offset: Offset(4, 4),
                  blurRadius: 24,
                ),
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
                color: Colors.black.withAlpha(180),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        // Spacer(),
        CustomGlass(
          radius: 100,
          child: CustomBlur(
            radius: 100,
            sigmaX: 3,
            sigmay: 3,
            child: CustomButton(
              colors: [
                Colors.white.withAlpha(80),
                Colors.white.withAlpha(60),
                Colors.white.withAlpha(20),
              ],

              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withAlpha(20),
              //     offset: Offset(4, 4),
              //     blurRadius: 24,
              //   ),
              // ],
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
              onTap: () {},

              child: Icon(
                Iconsax.notification_bing_copy,
                size: 18.h,
                color: Colors.black.withAlpha(180),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:masroof/core/utils/app_colors.dart';

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({
//     super.key,
//     this.name,
//     this.onSearchTap,
//     this.onNotificationTap,
//     this.hasUnreadNotifications = false,
//   });

//   final String? name;
//   final VoidCallback? onSearchTap;
//   final VoidCallback? onNotificationTap;
//   final bool hasUnreadNotifications;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Expanded + Align: the pill hugs its content but can shrink
//         // (ellipsis) on small screens instead of overflowing.
//         Expanded(
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: _ProfilePill(name: name),
//           ),
//         ),
//         SizedBox(width: 12.w),
//         _GlassIconButton(
//           icon: Iconsax.search_normal_copy,
//           tooltip: 'Search',
//           onTap: onSearchTap,
//         ),
//         SizedBox(width: 12.w),
//         _GlassIconButton(
//           icon: Iconsax.notification_bing_copy,
//           tooltip: 'Notifications',
//           onTap: onNotificationTap,
//           showBadge: hasUnreadNotifications,
//         ),
//       ],
//     );
//   }
// }

// class _ProfilePill extends StatelessWidget {
//   const _ProfilePill({this.name});
//   final String? name;

//   @override
//   Widget build(BuildContext context) {
//     return _GlassSurface(
//       padding: EdgeInsetsDirectional.fromSTEB(6.w, 4.h, 20.w, 4.h),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset('assets/app_icons/masroof_icon.png', height: 30.h),
//           SizedBox(width: 8.w),
//           Flexible(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SvgPicture.asset('assets/app_icons/Masroof.svg', height: 9.5.h),
//                 SizedBox(height: 2.h),
//                 Text.rich(
//                   TextSpan(
//                     text: 'Hi ',
//                     style: GoogleFonts.poppins(fontSize: 12.sp),
//                     children: [
//                       TextSpan(
//                         text: name ?? 'there',
//                         style: GoogleFonts.poppins(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.tertiaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _GlassIconButton extends StatelessWidget {
//   const _GlassIconButton({
//     required this.icon,
//     required this.tooltip,
//     this.onTap,
//     this.showBadge = false,
//   });

//   final IconData icon;
//   final String tooltip;
//   final VoidCallback? onTap;
//   final bool showBadge;

//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//       message: tooltip,
//       child: _GlassSurface(
//         child: Material(
//           type: MaterialType.transparency,
//           child: InkWell(
//             customBorder: const CircleBorder(),
//             onTap: onTap,
//             child: SizedBox.square(
//               dimension: 42.r, // comfortable touch target
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Icon(icon, size: 20.r),
//                   if (showBadge)
//                     Positioned(
//                       top: 10.r,
//                       right: 11.r,
//                       child: Container(
//                         width: 8.r,
//                         height: 8.r,
//                         decoration: BoxDecoration(
//                           color: AppColors.tertiaryColor,
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.white, width: 1.2),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// One reusable glass look for every element in the bar.
// class _GlassSurface extends StatelessWidget {
//   const _GlassSurface({required this.child, this.padding});
//   final Widget child;
//   final EdgeInsetsGeometry? padding;

//   @override
//   Widget build(BuildContext context) {
//     final radius = BorderRadius.circular(100);

//     return DecoratedBox(
//       decoration: BoxDecoration(
//         borderRadius: radius,
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black.withAlpha(18),
//         //     offset: const Offset(0, 8),
//         //     blurRadius: 24,
//         //   ),
//         // ],
//       ),
//       child: ClipRRect(
//         borderRadius: radius,
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//           child: Container(
//             padding: padding,
//             decoration: BoxDecoration(
//               borderRadius: radius,
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Colors.white.withAlpha(150),
//                   Colors.white.withAlpha(70),
//                 ],
//               ),
//               border: Border.all(color: Colors.white.withAlpha(110), width: 1),
//             ),
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
