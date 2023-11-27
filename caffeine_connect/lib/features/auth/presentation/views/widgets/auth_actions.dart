import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AuthActions extends StatelessWidget {
  final String? text1;
  final String? textButtonContent;
  final void Function()? onPressed;
  final String? dest;
  const AuthActions({
    super.key,
    this.text1,
    this.textButtonContent,
    this.onPressed,
    this.dest,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (text1 != null)
          Text(
            text1!,
            style: Styles.textStyle14.copyWith(
              color: ColorManager.grey2,
              fontFamily: Constants.poppins,
            ),
          ),
        if (textButtonContent != null)
          // button
          TextButton(
            onPressed: onPressed,
            child: Text(
              textButtonContent!,
              style: Styles.textStyle14.copyWith(
                color: ColorManager.secondary,
                fontFamily: Constants.poppins,
              ),
            ),
          ),
      ],
    );
  }
}
