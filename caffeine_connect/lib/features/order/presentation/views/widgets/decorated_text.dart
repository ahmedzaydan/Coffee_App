import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DecoratedText extends StatelessWidget {
  const DecoratedText({super.key, required this.name, this.color});
  final String name;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Styles.textStyle14.copyWith(
        fontFamily: Constants.dmSans,
        color: color ?? ColorManager.black1,
      ),
    );
  }
}
