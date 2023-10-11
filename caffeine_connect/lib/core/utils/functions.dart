import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateTo({
  required BuildContext context,
  required String dest,
  Object? extra,
  bool replace = false,
}) {
  replace == true
      ? GoRouter.of(context).pushReplacement(dest, extra: extra)
      : GoRouter.of(context).push(dest, extra: extra);
}

AppBar getCustomAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.arrow_back,
        color: ColorManager.black1,
      ),
    ),
    title: Text(
      title ?? StringsManager.empty,
      style: Styles.textStyle16.copyWith(
        color: ColorManager.black1,
      ),
    ),
    centerTitle: true,
    actions: actions ??
        [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.secondary,
            ),
          ),
        ],
  );
}
