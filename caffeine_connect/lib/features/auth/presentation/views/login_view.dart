import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_section.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/password.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Email(emailController: _emailController),
                    const SizedBox(height: ValuesManager.v10),
                    Password(passwordController: _passwordController),
                  ],
                ),
              ),

              const ForgotPassword(),

              AuthSection(
                buttonText: StringsManager.signIn,
                authSepText: StringsManager.orSignInWith,
                text1: StringsManager.newMember,
                textButtonText: StringsManager.signUp,
                dest: RoutesManager.registerView,
                onPressed: () {
                  // TODO: validate form before naviagation
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
