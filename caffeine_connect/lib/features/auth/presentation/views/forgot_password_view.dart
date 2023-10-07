import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForwardPasswordView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  ForwardPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppValues.v30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthText(
                text1: StringsManager.forgotPassword,
                text2: StringsManager.enterYourEmail,
              ),
              const SizedBox(height: AppValues.v10),
              // email address
              Form(
                key: _formKey,
                child: CustomTextFormField(
                  controller: _emailController,
                  hintText: StringsManager.email,
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: ColorManager.secondary,
                  ),
                ),
              ),
              const SizedBox(height: AppValues.v120),
              Align(
                alignment: Alignment.bottomRight,
                child: ForwardButton(
                  onPressed: () {
                    navigateTo(
                      context: context,
                      dest: RoutesManager.verificationView,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
