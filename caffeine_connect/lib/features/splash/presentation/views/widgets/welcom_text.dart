import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // text 1
        Text(
          StringsManager.welcomeText1,
          style: Styles.textStyle12.copyWith(
            fontSize: AppValues.v28,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppValues.v10),

        // text 2
        Text(
          StringsManager.welcomeText2,
          style: Styles.textStyle18.copyWith(
            color: ColorManager.grey2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
