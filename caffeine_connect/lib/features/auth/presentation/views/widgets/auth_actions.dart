import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:flutter/material.dart';

class AuthActions extends StatelessWidget {
  final String? text1;
  final String? textButtonContent;
  final void Function()? onPressed;
  final String? dest;
  final bool? withDelay;
  const AuthActions({
    super.key,
    this.text1,
    this.textButtonContent,
    this.onPressed,
    this.dest,
    this.withDelay,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (text1 != null)
          Text(
            text1!,
            style: Styles.textStyle14.copyWith(
              color: ColorManager.grey2,
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
              ),
            ),
          ),
        const Spacer(),
        ForwardButton(
          onPressed: dest != null
              ? () => navigateTo(
                    context: context,
                    dest: dest!,
                    withDelay: withDelay,
                  )
              : null,
        ),
      ],
    );
  }
}
