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
