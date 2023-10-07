import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class WelcomImage extends StatelessWidget {
  const WelcomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.v10),
      color: ColorManager.secondary,
      child: Center(
        child: Column(
          children: [
            // image
            Image.asset(
              AssetsManager.welcomeImage,
              width: double.infinity,
              height: 300,
            ),

            const SizedBox(height: AppValues.v10),
            // text
            const Text(
              StringsManager.magicCoffee,
              style: TextStyle(
                fontFamily: Constants.reenieBeanie,
                fontSize: AppValues.v64,
                color: ColorManager.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
