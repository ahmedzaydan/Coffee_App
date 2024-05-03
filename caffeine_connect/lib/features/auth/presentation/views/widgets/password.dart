import 'package:caffeine_connect/core/di.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  Password({
    super.key,
    required this.passwordController,
    // required this.authCubit,
  });

  final TextEditingController passwordController;
  final AuthCubit cubit = instance<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: StringsManager.password,
      prefixIcon: const Icon(
        Icons.lock_rounded,
        color: ColorManager.secondary,
      ),
      suffixIcon: Icon(
        cubit.isPasswordVisible
            ? Icons.visibility_off_rounded
            : Icons.visibility,
        color: ColorManager.secondary,
      ),
      obsecureText: cubit.isPasswordVisible ? false : true,
      suffixOnPressed: () {
        cubit.togglePasswordVisibility();
      },
      validator: (value) {
        return validatedPassword(value!);
      },
    );
  }
}
