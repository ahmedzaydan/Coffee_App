import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:flutter/material.dart';

import 'values_manager.dart';

abstract class Styles {
  static const TextStyle textStyle10 = TextStyle(
    fontSize: ValuesManager.v10,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle textStyle12 = TextStyle(
    fontSize: ValuesManager.v12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyle14 = TextStyle(
      fontSize: ValuesManager.v14,
      fontWeight: FontWeight.w500,
      fontFamily: Constants.poppins,
      color: ColorManager.black1);

  static const TextStyle textStyle16 = TextStyle(
    fontSize: ValuesManager.v16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyle18 = TextStyle(
    fontSize: ValuesManager.v18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyle20 = TextStyle(
    fontSize: ValuesManager.v20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle22 = TextStyle(
    fontSize: ValuesManager.v22,
    fontWeight: FontWeight.w500,
  );
}
