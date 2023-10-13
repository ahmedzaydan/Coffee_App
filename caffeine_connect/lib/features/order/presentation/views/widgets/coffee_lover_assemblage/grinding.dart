import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_icon.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class Grinding extends StatelessWidget {
  const Grinding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          StringsManager.grinding,
          style: Styles.textStyle14,
        ),
        Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomIcon(
                child: CustomImage(image: AssetsManager.coffeeSeed),
              ),
              
              SizedBox(width: AppValues.v10),

              CustomIcon(
                child: CustomImage(
                  image: AssetsManager.coffeeSeed,
                  height: AppValues.v45,
                  width: AppValues.v45,
                  color: ColorManager.black1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
