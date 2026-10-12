import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/auth/domain/entities/user_entity.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/features/home/Presentation/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity? user = BlocProvider.of<AuthCubit>(context).getCurrentUser();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: HomeAppBar(name: user?.displayName),
      ),
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 320.h,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: AppColors.secondaryColor
                gradient: buildSmoothGradient(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90.h),
                  Text(
                    'Total Balance ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withAlpha(200),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '\$ 124,892.65',
                    style: TextStyle(fontSize: 38, color: Colors.white),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'Today (',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withAlpha(200),
                        ),
                      ),
                      Text(
                        ' + \$9,892.65',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                      Text(
                        ' , ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withAlpha(200),
                        ),
                      ),
                      Text(
                        '- \$2,500.65 ',
                        style: TextStyle(fontSize: 12, color: Colors.orange),
                      ),
                      Text(
                        ')',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withAlpha(200),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recent transaction',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomButton(
                    colors: [Colors.red.shade200],
                    borderRadius: 10,
                    horizontalPadding: 16,
                    verticalPadding: 16,
                    onTap: () {},
                    child: Text(
                      'Transaction $index',
                      // style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient buildSmoothGradient() {
    const steps = 16;
    final colors = <Color>[];
    final stops = <double>[];

    for (var i = 0; i <= steps; i++) {
      final t = i / steps;
      final Color c;
      if (t < 0.5) {
        // secondary -> tertiary (first half)
        c = Color.lerp(
          AppColors.tertiaryColor,
          AppColors.tertiaryColor,
          Curves.easeInOut.transform(t * 2),
        )!;
      } else {
        // tertiary -> neutral (second half)
        c = Color.lerp(
          AppColors.tertiaryColor,
          AppColors.neutralColor,
          Curves.easeInOut.transform((t - 0.5) * 2),
        )!;
      }
      colors.add(c);
      stops.add(t);
    }

    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
      stops: stops,
    );
  }
}
