import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_actions.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/auth_separator.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/social_media_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthSection extends StatelessWidget {
  AuthSection({
    super.key,
    required this.buttonText,
    required this.authSepText,
    required this.text1,
    required this.textButtonText,
    required this.dest,
    required this.onPressed,
  });

  final String buttonText;
  final String authSepText;
  final String text1;
  final String textButtonText;
  final String dest;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
          text: buttonText,
          textStyle: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w700,
          ),
          onPressed: onPressed,
        ),
        const Gap(10),
        AuthSeparator(text: authSepText),
        const SocialMediaAuth(),
        Center(
          child: AuthActions(
            text1: text1,
            textButtonContent: textButtonText,
            onPressed: () {
              navigateTo(
                context: context,
                dest: dest,
              );
            },
          ),
        ),
      ],
    );
  }
}
