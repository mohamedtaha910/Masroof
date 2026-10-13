import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/features/home/Presentation/widgets/custom_nav_bar.dart';

class AppRoot extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppRoot({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: navigationShell),

          Positioned(
            left: 16,
            right: 16,
            bottom: 8.h,
            child: CustomNavBar(
              selectedIndex: navigationShell.currentIndex,
              onChanged: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
