import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:flutter/material.dart';

void navigateTo({
  required BuildContext context,
  required String dest,
  int durationInSeconds = Constants.splashScreenDelayInSeconds,
  Object? extra,
}) {
  // Future.delayed(
  //   Duration(seconds: durationInSeconds),
  //   () => GoRouter.of(context).push(dest, extra: extra),
  // );
}
