import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateTo({
  required BuildContext context,
  required String dest,
  int durationInSeconds = Constants.splashScreenDelayInSeconds,
  Object? extra,
  bool? withDelay,
}) {
  if (withDelay == true) {
    Future.delayed(
      Duration(seconds: durationInSeconds),
      () => GoRouter.of(context).push(dest, extra: extra),
    );
  } else {
    GoRouter.of(context).push(dest, extra: extra);
  }
}
