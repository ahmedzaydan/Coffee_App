import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.items,
    this.child = StringsManager.select,
  });

  final List<PopupMenuEntry<String>> items;
  final String child;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ValuesManager.v10),
      ),
      constraints: const BoxConstraints(
        maxWidth: ValuesManager.v250,
        maxHeight: ValuesManager.v200,
      ),
      itemBuilder: (context) => items,
      onSelected: (String value) {
        print('value: $value');
      },
      // padding: EdgeInsets.zero,
      child: Text(
        child,
        style: Styles.textStyle14,
      ),
    );
  }
}
