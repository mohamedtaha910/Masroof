import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

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
              const Expanded(
                child: Divider(thickness: 0.8, color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'or continue with',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(thickness: 0.8, color: Colors.grey),
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
                    // BlocProvider.of<AuthCubit>(context).signInWithGoogle();
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
        height: 42.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade100.withAlpha(120),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: Colors.grey.shade400.withAlpha(120),
            width: 0.8.w,
          ),
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
