import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';

class MagicCoffee extends StatelessWidget {
  const MagicCoffee({super.key, required this.fontSize});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      StringsManager.magicCoffee,
      style: TextStyle(
        fontFamily: Constants.reenieBeanie,
        fontSize: fontSize,
        color: ColorManager.primary,
      ),
    );
  }
}
