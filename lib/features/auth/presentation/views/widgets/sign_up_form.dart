import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/auth/presentation/views/widgets/auth_text_feild.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_shift.dart';
import 'package:masroof/features/auth/presentation/views/widgets/other_way.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.white.withAlpha(100), width: 1.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.h),
          SvgPicture.asset(
            'assets/auth_icons/Sign_Up_word.svg',
            height: 26.h,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          SizedBox(height: 5.h),
          Text(
            'Create an account to get started',
            style: TextStyle(fontSize: 12.sp, color: Colors.black38),
          ),
          SizedBox(height: 38.h),
          Text(
            'Full Name',
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade800,
            ),
          ),

          SizedBox(height: 10.h),
          AuthTextFeild(
            height: 10,
            hintText: 'Your Name',
            // icon: Icons.email,
            icon: Icons.person,
            onChanged: (value) {
              // email = value;
            },
            borderRadius: 100,
            obscureText: false,
            paddign: 0,
          ),
          SizedBox(height: 16.h),
          Text(
            'Email address',
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade800,
            ),
          ),

          SizedBox(height: 10.h),
          AuthTextFeild(
            height: 10,
            hintText: 'Email',
            // icon: Icons.email,
            icon: Icons.mail_rounded,
            onChanged: (value) {
              // email = value;
            },
            borderRadius: 100,
            obscureText: false,
            paddign: 0,
          ),
          SizedBox(height: 16.h),
          Text(
            'Password',
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 10.h),
          AuthTextFeild(
            height: 10,
            hintText: 'Password',
            paddign: 0,
            icon: Icons.lock,
            // icon: CupertinoIcons.lock_circle_fill,
            onChanged: (value) {
              // password = value;
            },
            borderRadius: 100,
            obscureText: true,
          ),
          SizedBox(height: 28.h),
          CustomButton(
            width: double.infinity,

            color: AppColors.tertiaryColor,
            borderRadius: 14,

            verticalPadding: 8,
            onTap: () {
              // autovalidateMode = AutovalidateMode.always;
              // setState(() {});

              // if (formKey.currentState!.validate()) {
              //   BlocProvider.of<AuthCubit>(
              //     context,
              //   ).loginUser(
              //     email: email!,
              //     password: password!,
              //   );
              // }
            },
            horizontalPadding: 10,
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.h,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24.h),
          OtherWay(),
          SizedBox(height: 24.h),
          CustomShift(
            destination: AppRoutes.kLoginPage,
            text: 'Log In',
            text2: 'Already have an account?  ',
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
