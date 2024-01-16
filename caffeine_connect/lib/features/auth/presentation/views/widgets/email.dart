import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: StringsManager.email,
      prefixIcon: const Icon(
        Icons.email_rounded,
        color: ColorManager.secondary,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email should not be empty";
        }
        else if (validatedEmail(emailController.text) != null) {
          return validatedEmail(emailController.text);
        }
        return null;
      },
    );
  }
}
