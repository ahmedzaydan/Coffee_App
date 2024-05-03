import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_options.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showCustomToast(
            message: state.error,
            state: ToastStates.ERROR,
          );
        }
        if (state is LoginSuccessState) {
          showCustomToast(
            message: StringsManager.success,
            state: ToastStates.SUCCESS,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Email(emailController: _emailController),
              const SizedBox(height: ValuesManager.v10),

              // Password
              Password(passwordController: _passwordController),

              const ForgotPassword(),

              const Gap(5),

              // Sign in button
              CustomMaterialButton(
                text: StringsManager.signIn,
                textStyle: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await AuthCubit.get(context)
                        .login(
                      method: AuthMethod.firebase,
                      email: _emailController.text,
                      password: _passwordController.text,
                    )
                        .then((value) {
                      navigateTo(
                        context: context,
                        dest: RoutesManager.menuView,
                        replace: true,
                      );
                    });
                  }
                },
              ),

              // const Gap(15),

              // const AuthSeparator(text: StringsManager.orSignInWith),

              // const SocialMediaAuth(),

              // New member, sign up
              const AuthOptions(
                text1: StringsManager.newMember,
                textButtonText: StringsManager.signUp,
                dest: RoutesManager.registerView,
              ),
            ],
          ),
        );
      },
    );
  }
}
