import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/decorated_text.dart';
import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(AppValues.v40),
        ),
        disabledBackgroundColor: ColorManager.secondary,
        minimumSize: Size(width, AppValues.v46),
      ),
      onPressed: onPressed,
      child: const DecoratedText(
        name: StringsManager.next,
        color: ColorManager.primary,
      ),
    );
  }
}
