import 'package:flutter/material.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/auth/presentation/widgets/auth_body.dart';
import 'package:masroof/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.secondaryColor.withAlpha(100),
                      AppColors.tertiaryColor.withAlpha(80),
                      // AppColors.secondaryColor.withAlpha(80),
                      Colors.deepPurpleAccent.withAlpha(80),
                    ],
                  ),
                ),
                child: AuthBody(formWidget: SignUpForm()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
