import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:flutter/material.dart';

class AuthSeparator extends StatelessWidget {
  const AuthSeparator({
    super.key,
    required this.text,
    this.color = ColorManager.grey2,
  });

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: VerticalSeparator(color: color),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ValuesManager.v10),
          child: Text(
            text,
            style: Styles.textStyle14.copyWith(
              color: ColorManager.grey1,
            ),
          ),
        ),
        Expanded(
          child: VerticalSeparator(color: color),
        ),
      ],
    );
  }
}
