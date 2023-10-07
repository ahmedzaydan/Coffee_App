import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class AuthText extends StatelessWidget {
  final String text1;
  final String text2;
  const AuthText({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: Styles.textStyle22.copyWith(
            color: ColorManager.secondary2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppValues.v20),
          child: Text(
            text2,
            style: Styles.textStyle14.copyWith(
              color: ColorManager.grey2,
            ),
          ),
        ),
      ],
    );
  }
}
