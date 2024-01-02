import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({
    super.key,
    required this.passwordController,
    // required this.authCubit,
  });

  final TextEditingController passwordController;
  // final AuthCubit authCubit; // TODO: pass this here

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: StringsManager.password,
      prefixIcon: const Icon(
        Icons.lock_rounded,
        color: ColorManager.secondary,
      ),

      suffixIcon: const Icon(
        Icons.visibility, // TODO: toggle visibility
        color: ColorManager.secondary,
      ),

      obsecureText: true,
      suffixOnPressed: () {},
    );
  }
}
