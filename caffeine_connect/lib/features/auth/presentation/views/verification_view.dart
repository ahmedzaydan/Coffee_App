import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_text.dart';
import 'package:flutter/material.dart';

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
              const Center(child: CodeDigitsInput()),
              const SizedBox(height: ValuesManager.v20),
              // TODO: validate before naviagation
              Align(
                alignment: Alignment.bottomRight,
                child: ForwardButton(
                  onPressed: () {
                    navigateTo(
                      context: context,
                      dest: RoutesManager.splashView,
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

class CodeDigitsInput extends StatelessWidget {
  const CodeDigitsInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ValuesManager.v70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(ValuesManager.v10),
            height: ValuesManager.v70,
            width: ValuesManager.v48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ValuesManager.v10),
              color: ColorManager.offWhite,
              border: Border.all(
                color: ColorManager.secondary,
                width: ValuesManager.v2,
              ),
            ),
            // child: const TextField(), // TODO: implement this later
          );
        },
        itemCount: Constants.codeLength,
      ),
    );
  }
}
