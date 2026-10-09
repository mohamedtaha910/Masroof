import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/features/auth/presentation/views/widgets/auth_body.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:masroof/features/auth/presentation/views/widgets/login_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is AuthLoading,
          // inAsyncCall: true,
          child: GestureDetector(
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
                    child: AuthBody(formWidget: LoginForm()),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
