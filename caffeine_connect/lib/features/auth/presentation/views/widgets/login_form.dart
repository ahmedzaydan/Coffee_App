import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key});
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
              Password(passwordController: _passwordController),
              const ForgotPassword(),

              const Gap(5),

              // Sign in button
              CustomMaterialButton(
                text: StringsManager.signIn,
                textStyle: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthCubit.get(context).login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
