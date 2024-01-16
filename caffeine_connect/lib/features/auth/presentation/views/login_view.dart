import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_section.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
              const Gap(15),
              const AuthSection(
                authSepText: StringsManager.orSignInWith,
                text1: StringsManager.newMember,
                textButtonText: StringsManager.signUp,
                dest: RoutesManager.registerView,
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
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
