import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/features/splash/Presentation/pages/on_boarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wallet, size: 40),
                SizedBox(width: 12),
                Text(
                  'Masroof',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 12),

            Text(
              'Manage your Masroof ',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRoutes.kOnBoarding1);
    });
  }
}
