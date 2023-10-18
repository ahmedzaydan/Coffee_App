import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_actions.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                text1: StringsManager.signUp,
                text2: StringsManager.createAccount,
              ),
              RegisterForm(),
              const SizedBox(height: ValuesManager.v120),
              AuthActions(
                text1: StringsManager.alreadyAMember,
                textButtonContent: StringsManager.signIn,
                onPressed: () {
                  navigateTo(
                    context: context,
                    dest: RoutesManager.loginView,
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

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // name
          CustomTextFormField(
            controller: _nameController,
            hintText: StringsManager.createAccount,
            prefixIcon: const Icon(
              Icons.person_rounded,
              color: ColorManager.secondary,
            ),
          ),

          const SizedBox(height: ValuesManager.v10),

          // mobile number
          CustomTextFormField(
            controller: _mobileNumberController,
            keyboardType: TextInputType.phone,
            hintText: StringsManager.mobileNumber,
            prefixIcon: const Icon(
              Icons.phone_android_rounded,
              color: ColorManager.secondary,
            ),
          ),

          const SizedBox(height: ValuesManager.v10),

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
