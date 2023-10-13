import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:flutter/material.dart';

class MilkSyrup extends StatelessWidget {
  const MilkSyrup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              StringsManager.milk,
              style: Styles.textStyle14,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                StringsManager.select,
                style: Styles.textStyle14,
              ),
            ),
          ],
        ),
        const VerticalSeparator(),
        Row(
          children: [
            const Text(
              StringsManager.syrup,
              style: Styles.textStyle14,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                StringsManager.select,
                style: Styles.textStyle14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
