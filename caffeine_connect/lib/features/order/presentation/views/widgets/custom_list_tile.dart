import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: ValuesManager.v0,
      onTap: onTap,
      title: Text(
        title,
        style: Styles.textStyle14,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: ValuesManager.v20,
        color: ColorManager.grey3, // TODO: check compatability with theme
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
