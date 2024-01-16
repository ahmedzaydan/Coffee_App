import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_section.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              const AuthSection(
                authSepText: StringsManager.orSignUpWith,
                text1: StringsManager.alreadyAMember,
                textButtonText: StringsManager.signIn,
                dest: RoutesManager.loginView,
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
          // username
          CustomTextFormField(
            controller: _nameController,
            hintText: StringsManager.username,
            prefixIcon: const Icon(
              Icons.person_rounded,
              color: ColorManager.secondary,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Username should not be empty";
              }
              return null;
            },
          ),

          const SizedBox(height: ValuesManager.v10),

          // mobile number
          CustomTextFormField(
            controller: _mobileNumberController,
            keyboardType: TextInputType.phone,
            hintText: StringsManager.mobileNumber,
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
            ],
            prefixIcon: const Icon(
              Icons.phone_android_rounded,
              color: ColorManager.secondary,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Mobile number should not be empty";
              } else if (value.length < 11) {
                return "Mobile number should be 11 digits";
              }
              return null;
            },
          ),

          const SizedBox(height: ValuesManager.v10),
          Email(emailController: _emailController),
          const SizedBox(height: ValuesManager.v10),
          Password(passwordController: _passwordController),

          // Sign up button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ValuesManager.v20),
            child: CustomMaterialButton(
              text: StringsManager.signUp,
              textStyle: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w700,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  AuthCubit.get(context).register(
                    username: _nameController.text,
                    mobileNumber: _mobileNumberController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
