import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final BuildContext sourceContext;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    required this.sourceContext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // back arrow
        IconButton(
          onPressed: () {
            Navigator.pop(sourceContext);
          },
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.black1,
          ),
        ),
        // title
        Text(
          title,
          style: Styles.textStyle16.copyWith(
            color: ColorManager.black1,
          ),
        ),
        // actions
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: actions ??
              [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorManager.secondary,
                  ),
                ),
              ],
        ),
      ],
    );
  }
}
