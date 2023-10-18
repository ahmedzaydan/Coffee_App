import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_actions.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ValuesManager.v30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthText(
                text1: StringsManager.signIn,
                text2: StringsManager.welcomeBack,
              ),
              LoginForm(),
              const SizedBox(height: ValuesManager.v10),
              // forgot password
              const Padding(
                padding: EdgeInsets.only(
                  top: ValuesManager.v10,
                  bottom: ValuesManager.v120,
                ),
                child: ForgotPassword(),
              ),

              AuthActions(
                text1: StringsManager.newMember,
                textButtonContent: StringsManager.signUp,
                onPressed: () {
                  navigateTo(
                    context: context,
                    dest: RoutesManager.registerView,
                  );
                },
                // TODO: validate form before naviagation
                // dest: RoutesManager.splashView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // email
          CustomTextFormField(
            controller: _emailController,
            hintText: StringsManager.email,
            prefixIcon: const Icon(
              Icons.email_rounded,
              color: ColorManager.secondary,
            ),
          ),

          const SizedBox(height: ValuesManager.v10),

          // password
          CustomTextFormField(
            controller: _passwordController,
            hintText: StringsManager.password,
            prefixIcon: const Icon(
              Icons.lock_rounded,
              color: ColorManager.secondary,
            ),
            suffixIcon: const Icon(
              Icons.visibility,
              color: ColorManager.secondary,
            ),
            obsecureText: true,
            suffixOnPressed: () {
              // TODO: implement password visibility
            },
          ),
        ],
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => navigateTo(
          context: context,
          dest: RoutesManager.forgotPasswordView,
        ),
        child: Text(
          StringsManager.forgotPassword,
          style: Styles.textStyle14.copyWith(
            color: ColorManager.secondary,
            decoration: TextDecoration.underline,
            fontFamily: Constants.poppins,
          ),
        ),
      ),
    );
  }
}
