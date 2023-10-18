import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/widgets/custom_popup_menu_button.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:flutter/material.dart';

class MilkSyrup extends StatelessWidget {
  const MilkSyrup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // milk
        Row(
          children: [
            const Text(
              StringsManager.milk,
              style: Styles.textStyle14,
            ),
            const Spacer(),
            CustomPopupMenuButton(items: milkOptions),
          ],
        ),
        const VerticalSeparator(),
        // syrup
        Row(
          children: [
            const Text(
              StringsManager.syrup,
              style: Styles.textStyle14,
            ),
            const Spacer(),
            CustomPopupMenuButton(items: syrupOptions),
          ],
        ),
      ],
    );
  }
}



List<PopupMenuItem<String>> milkOptions = [
  _buildPopupMenuItem(value: StringsManager.none),
  _buildPopupMenuItem(value: StringsManager.cows),
  _buildPopupMenuItem(value: StringsManager.lactoseFree),
  _buildPopupMenuItem(value: StringsManager.skimmed),
  _buildPopupMenuItem(value: StringsManager.vegatable),
];

List<PopupMenuItem<String>> syrupOptions = [
  _buildPopupMenuItem(value: StringsManager.none),
  _buildPopupMenuItem(value: StringsManager.amaretto),
  _buildPopupMenuItem(value: StringsManager.coconut),
  _buildPopupMenuItem(value: StringsManager.vanilla),
  _buildPopupMenuItem(value: StringsManager.caramel),
];

PopupMenuItem<String> _buildPopupMenuItem({
  required String value,
}) {
  return PopupMenuItem<String>(
    value: value,
    // padding: EdgeInsets.all(10),
    child: Center(
      child: Text(
        value,
        style: Styles.textStyle16,
      ),
    ),
  );
}
