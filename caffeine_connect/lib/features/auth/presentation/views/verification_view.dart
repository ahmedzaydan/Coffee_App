import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

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
                text1: StringsManager.verification,
                text2: StringsManager.enterCode,
              ),
              const SizedBox(height: ValuesManager.v20),
              Center(child: CodeDigitsInput()),
              const SizedBox(height: ValuesManager.v20),
              CustomMaterialButton(
                text: StringsManager.verify,
                onPressed: () {
                  navigateTo(
                    context: context,
                    dest: RoutesManager.splashView,
                    replace: true,
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

class CodeDigitsInput extends StatelessWidget {
  CodeDigitsInput({super.key});
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      controller: otpController,
      length: Constants.codeLength,
      width: MediaQuery.of(context).size.width,
      fieldWidth: ValuesManager.v40,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {},
      keyboardType: TextInputType.number,
    );
  }
}
