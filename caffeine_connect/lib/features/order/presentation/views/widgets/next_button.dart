import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

// TODO: replace arrow with login or register button
class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onPressed,
    this.width = double.infinity,
  });
  final void Function()? onPressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValuesManager.v40),
        ),
        disabledBackgroundColor: ColorManager.secondary,
        minimumSize: Size(width, ValuesManager.v46),
      ),
      onPressed: onPressed,
      child: Text(
        StringsManager.next,
        style: Styles.textStyle14.copyWith(
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
