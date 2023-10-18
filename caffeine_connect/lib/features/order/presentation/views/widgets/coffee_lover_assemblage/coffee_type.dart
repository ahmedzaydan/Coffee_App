import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          StringsManager.coffeeType,
          style: Styles.textStyle14,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                activeColor: ColorManager.blue,
                inactiveColor: ColorManager.grey3,
                thumbColor: ColorManager.primary,
                min: ValuesManager.v0,
                max: ValuesManager.v2,
                value: 1,
                onChanged: (value) {
                  if (kDebugMode) print('Value: $value');
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: ValuesManager.v22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.arabica,
                      style: Styles.textStyle12.copyWith(
                        color: ColorManager.grey1,
                        fontFamily: Constants.dmSans,
                      ),
                    ),
                    Text(
                      StringsManager.robusta,
                      style: Styles.textStyle12.copyWith(
                        color: ColorManager.grey1,
                        fontFamily: Constants.dmSans,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
