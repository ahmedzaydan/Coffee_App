import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/social_media_auth.dart';
import 'package:flutter/material.dart';

class AuthSection extends StatelessWidget {
  const AuthSection({
    super.key,
    required this.authSepText,
    required this.text1,
    required this.textButtonText,
    required this.dest,
  });

  final String authSepText;
  final String text1;
  final String textButtonText;
  final String dest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthSeparator(text: authSepText),
        const SocialMediaAuth(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text1,
              style: Styles.textStyle14.copyWith(
                color: ColorManager.grey2,
                fontFamily: Constants.poppins,
              ),
            ),
            // button
            TextButton(
              onPressed: () {
                navigateTo(
                  context: context,
                  dest: dest,
                );
              },
              child: Text(
                textButtonText,
                style: Styles.textStyle14.copyWith(
                  color: ColorManager.secondary,
                  fontFamily: Constants.poppins,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AuthSeparator extends StatelessWidget {
  const AuthSeparator({
    super.key,
    required this.text,
    this.color = ColorManager.grey2,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: VerticalSeparator(color: color),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ValuesManager.v10),
          child: Text(
            text,
            style: Styles.textStyle14.copyWith(
              color: ColorManager.grey1,
            ),
          ),
        ),
        Expanded(
          child: VerticalSeparator(color: color),
        ),
      ],
    );
  }
}
