import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_glass.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  static const Color _activeColor = Color(0xFF8CC0FF);
  static const Color _inactiveColor = Color.fromARGB(255, 64, 69, 75);

  static const List<IconData> _icons = [
    Iconsax.home_copy,
    Iconsax.transaction_minus_copy,
    Icons.stacked_bar_chart_rounded,
    Icons.person_rounded,
  ];

  static const List<IconData> _selectedIcons = [
    Iconsax.home_1,
    Iconsax.transaction_minus,

    Icons.bar_chart_rounded,
    Icons.person_rounded,
  ];

  static const List<String> _labels = ['', '', '', ''];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width - 68.w;
    // final height = width < 340 ? 62.0 : 70.0;
    final height = 50.h;
    final itemWidth = width / _icons.length;

    return SizedBox(
      width: double.infinity,
      // width: width,
      height: height,
      child: CustomGlass(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.white.withAlpha(150),
                color: Colors.grey.shade100.withAlpha(60),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white.withAlpha(220)),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                    left: selectedIndex * itemWidth + 5,
                    top: 5,
                    bottom: 5,
                    width: itemWidth - 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _activeColor.withAlpha(35),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: _activeColor.withAlpha(50)),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: List.generate(_icons.length, (index) {
                        final isSelected = selectedIndex == index;

                        return Expanded(
                          child: InkWell(
                            onTap: () => onChanged(index),
                            borderRadius: BorderRadius.circular(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isSelected
                                      ? _selectedIcons[index]
                                      : _icons[index],
                                  size: isSelected ? 24.h : 22.h,
                                  color: isSelected
                                      ? _activeColor
                                      : _inactiveColor,
                                ),
                                // const SizedBox(height: 4),
                                // Text(
                                //   _labels[index],
                                //   maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: TextStyle(
                                //     fontSize: width < 340 ? 9 : 10,
                                //     fontWeight: isSelected
                                //         ? FontWeight.w600
                                //         : FontWeight.w400,
                                //     color: isSelected
                                //         ? _activeColor
                                //         : _inactiveColor,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// ===============================================



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:liquid_glass_easy/liquid_glass_easy.dart';

// class CustomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onChanged;

//   const CustomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onChanged,
//   });

  
//   @override
//   Widget build(BuildContext context) {
//     // final screenWidth = MediaQuery.sizeOf(context).width;

//     return LiquidGlassTabBar(
//       // width: screenWidth - 32.w,
//       height: 52.h,
//       itemPadding: 5.h,

//       items: const [
//         LiquidGlassTabBarItem(
//           icon: Iconsax.home_copy,
//           // label: 'Home',
//           selectedIcon: Iconsax.home_1,
//         ),
//         LiquidGlassTabBarItem(
//           icon: Iconsax.transaction_minus_copy,
//           // label: 'Transaction',
//           selectedIcon: Iconsax.transaction_minus,
//         ),
//         LiquidGlassTabBarItem(
//           icon: Icons.bar_chart_rounded,
//           // label: 'Analytics',
//           selectedIcon: Icons.stacked_bar_chart_rounded,
//         ),
//         LiquidGlassTabBarItem(
//           icon: Icons.person_outline_rounded,
//           //  label: 'Profile'
//           selectedIcon: Icons.person_rounded,
//         ),
//       ],

//       selectedIndex: selectedIndex,
//       onChanged: onChanged,

//       // Icon and label colors
//       itemStyle: LiquidGlassTabItemStyle(
//         selectedColor: Colors.black,
//         unselectedColor: Colors.black,
//         iconSize: 22.h,
//         labelFontSize: 9.sp,
//         selectedFontWeight: FontWeight.w600,
//         unselectedFontWeight: FontWeight.w500,
//       ),

//       // Selected tab appearance
//       pillStyle: LiquidGlassTabPillStyle(
//         color: Colors.black.withAlpha(25),
//         animated: true,
//         animationDuration: Duration(milliseconds: 300),
//         shape: LiquidGlassShape.roundedRectangle(
//           cornerRadius: 100.r,
//           clipQuality: LiquidGlassClipQuality.exact,
//         ),
//       ),

//       // Main glass bar appearance
//       style: LiquidGlassTabBar.defaultStyle.copyWith(
//         // color: AppColors.primaryColor.withAlpha(20),
//         color: Colors.grey.shade100.withAlpha(150),
//         blur: 3,
//         shape: LiquidGlassShape.roundedRectangle(
//           clipQuality: LiquidGlassClipQuality.roundedRectangle,
//           cornerRadius: 100.r,
//         ),
//       ),
//     );
//   }
// }
