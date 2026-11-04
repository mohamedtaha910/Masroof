import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';

class OtherWay extends StatelessWidget {
  const OtherWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          //  Divider
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.8,
                  color: Colors.white.withAlpha(150),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'or continue with',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.mutedColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.8,
                  color: Colors.white.withAlpha(150),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          //  Social buttons
          Row(
            children: [
              Expanded(
                child: _SocialBtn(
                  label: 'Google',
                  icon: SvgPicture.asset(
                    'assets/auth_icons/google.svg',
                    height: 24,
                  ),
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _SocialBtn(
                  label: 'Apple',
                  icon: Icon(
                    Icons.apple_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _SocialBtn({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(100),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white.withAlpha(120), width: 0.8.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                // color: _kGray900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
