import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  ForgotPasswordView({super.key});

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
                text1: StringsManager.forgotPassword,
                text2: StringsManager.enterYourEmail,
              ),
              const SizedBox(height: ValuesManager.v10),
              Email(emailController: _emailController),
              const Gap(ValuesManager.v20),
              CustomMaterialButton(
                text: StringsManager.sendCode,
                onPressed: () {
                  navigateTo(
                    // TODO: validate before naviagation
                    context: context,
                    dest: RoutesManager.verificationView,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
