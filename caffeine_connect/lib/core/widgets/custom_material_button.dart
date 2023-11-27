import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.width = double.infinity,
    this.height = ValuesManager.v40,
    this.color = ColorManager.secondary,
    this.textColor = ColorManager.primary,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.borderRadius = Constants.buttonRadius,
  });
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      textColor: textColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
