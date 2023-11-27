import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => navigateTo(
          context: context,
          dest: RoutesManager.forgotPasswordView,
        ),
        child: Text(
          StringsManager.forgotPassword,
          style: Styles.textStyle14.copyWith(
            color: ColorManager.secondary,
            decoration: TextDecoration.underline,
            fontFamily: Constants.poppins,
          ),
        ),
      ),
    );
  }
}
