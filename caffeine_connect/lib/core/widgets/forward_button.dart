import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.secondary,
      radius: Constants.nextButtonRadius,
      child: IconButton(
        iconSize: 32,
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {
          // TODO: navigate to the next screen
        },
      ),
    );
  }
}
