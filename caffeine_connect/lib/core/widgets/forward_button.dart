import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    super.key,
    this.onPressed,
    this.iconColor = ColorManager.primary,
  });
  final void Function()? onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.secondary,
      radius: Constants.buttonRadius,
      child: IconButton(
        iconSize: ValuesManager.v32,
        icon: Icon(
          Icons.arrow_forward,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
