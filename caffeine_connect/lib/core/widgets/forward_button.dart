import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  final void Function()? onPressed;
  const ForwardButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.secondary,
      radius: Constants.nextButtonRadius,
      child: IconButton(
        iconSize: 32,
        icon: const Icon(Icons.arrow_forward),
        onPressed: onPressed,
      ),
    );
  }
}
