import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/auth/domain/entities/user_entity.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/features/home/Presentation/widgets/home_app_bar.dart';
import 'package:masroof/features/home/Presentation/widgets/home_header.dart';
import 'package:masroof/features/home/Presentation/widgets/recent_transaction.dart';

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
            HomeHeader(),
            Transform.translate(
              offset: Offset(0, -20),
              child: RecentTransaction(),
            ),
          ],
        ),
      ),
    );
  }
}
