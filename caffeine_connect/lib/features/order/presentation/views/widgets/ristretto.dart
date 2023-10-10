import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/decorated_text.dart';
import 'package:flutter/material.dart';

class Ristretto extends StatelessWidget {
  const Ristretto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const DecoratedText(name: StringsManager.ristretto),
        const Spacer(),
        Container(
          height: AppValues.v40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.v50),
            border: Border.all(
              color: ColorManager.grey3,
              width: AppValues.v2,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.one,
              style: Styles.textStyle12.copyWith(
                fontFamily: Constants.dmSans,
                color: ColorManager.black1,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppValues.v10),
        Container(
          height: AppValues.v40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.v50),
            border: Border.all(
              color: ColorManager.grey3,
              width: AppValues.v2,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.two,
              style: Styles.textStyle12.copyWith(
                fontFamily: Constants.dmSans,
                color: ColorManager.black1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
