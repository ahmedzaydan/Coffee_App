import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class OnsiteTakeaway extends StatelessWidget {
  const OnsiteTakeaway({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          StringsManager.onsiteTakeaway,
          style: Styles.textStyle14,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.coffee_outlined,
            color: ColorManager.grey1, // TODO: get color from cubit
          ),
        ),
        const SizedBox(width: ValuesManager.v10),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.local_drink_rounded),
        ),
      ],
    );
  }
}
