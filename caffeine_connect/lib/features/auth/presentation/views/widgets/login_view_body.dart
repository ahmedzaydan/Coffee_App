import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_actions.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_separator.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/social_media_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// TODO: actual login 
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthText(
          text1: StringsManager.signIn,
          text2: StringsManager.welcomeBack,
        ),

        LoginForm(),

        // TODO: toggle visibility
        const ForgotPassword(),

        // login button
        CustomMaterialButton(
          text: StringsManager.signIn,
          textStyle: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
          onPressed: () {
            // TODO: validate form before naviagation
          },
        ),

        const Gap(10),

        const AuthSeparator(text: StringsManager.orSignInWith),

        const SocialMediaAuth(),

        Center(
          child: AuthActions(
            text1: StringsManager.newMember,
            textButtonContent: StringsManager.signUp,
            onPressed: () {
              navigateTo(
                context: context,
                dest: RoutesManager.registerView,
              );
            },
          ),
        ),
      ],
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
            suffixOnPressed: () {},
          ),
        ],
      ),
    );
  }
}
