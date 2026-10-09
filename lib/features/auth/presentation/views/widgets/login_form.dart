import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/core/widgets/show_error_message.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/features/auth/presentation/views/widgets/auth_text_feild.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_shift.dart';
import 'package:masroof/features/auth/presentation/views/widgets/other_way.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // if (state is AuthLoading) {
        //   isLoading = true;
        //   setState(() {});
        // }

        if (state is AuthSuccess) {
          setState(() {});
          GoRouter.of(context).push(AppRoutes.kHomePage);
        } else if (state is AuthError) {
          setState(() {});
          showErrorMessage(context, message: state.error);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(100),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: Colors.white.withAlpha(100), width: 1.w),
          ),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                SvgPicture.asset(
                  'assets/auth_icons/Log_in_word.svg',
                  height: 26.h,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Welcome back! Login to your account',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black38),
                ),
                SizedBox(height: 38.h),
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
                    email = value;
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
                    password = value;
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
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});

                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).loginUser(email: email!, password: password!);
                    }
                  },
                  horizontalPadding: 10,
                  child: Text(
                    'Log in',
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
                  destination: AppRoutes.kSignUpPage,
                  text: 'Register Now',
                  text2: 'Don\'t have an account?  ',
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
