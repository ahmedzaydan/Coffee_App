import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({
    super.key,
    required this.text1,
    required this.textButtonText,
    required this.dest,
  });

  final String text1;
  final String textButtonText;
  final String dest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
