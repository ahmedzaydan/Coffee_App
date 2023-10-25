import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_icon.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_images.dart';
import 'package:flutter/material.dart';

class Roasting extends StatelessWidget {
  const Roasting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          StringsManager.roasting,
          style: Styles.textStyle14,
        ),
        Spacer(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // one flame
              CustomIcon(
                child: CustomSvgImage(image: AssetsManager.flame),
              ),

              // two flames
              CustomIcon(
                count: 2,
                child: CustomSvgImage(image: AssetsManager.flame),
              ),

              // three flames
              CustomIcon(
                count: 3,
                child: CustomSvgImage(
                  image: AssetsManager.flame,
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
