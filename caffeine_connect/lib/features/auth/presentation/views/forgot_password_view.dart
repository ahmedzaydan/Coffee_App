import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgotPasswordView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            showCustomToast(
              state: ToastStates.SUCCESS,
              message:
                  'We sent to ${state.email} a reset password link.Please check your email.',
            );
            navigateTo(
              context: context,
              dest: RoutesManager.loginView,
            );
          } else if (state is ResetPasswordErrorState) {
            showCustomToast(
              state: ToastStates.ERROR,
              message: state.error,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(ValuesManager.v30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthText(
                    text1: StringsManager.forgotPassword,
                    text2: StringsManager.enterYourEmail,
                  ),
                  const SizedBox(height: ValuesManager.v10),
                  Email(emailController: _emailController),
                  const Gap(ValuesManager.v20),
                  CustomMaterialButton(
                    text: StringsManager.resetPassword,
                    onPressed: () async {
                      await AuthCubit.get(context).resetPassword(
                        email: _emailController.text,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
