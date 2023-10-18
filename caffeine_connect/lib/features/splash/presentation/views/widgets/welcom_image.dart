import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.primary,
      ),
      padding: const EdgeInsets.all(ValuesManager.v10),
      child: Center(
        child: Column(
          children: [
            // image
            Image.asset(
              AssetsManager.welcomeImage,
              width: double.infinity,
              height: 300,
            ),

            const SizedBox(height: ValuesManager.v10),
            // text
            const Text(
              StringsManager.magicCoffee,
              style: TextStyle(
                fontFamily: Constants.reenieBeanie,
                fontSize: ValuesManager.v64,
                color: ColorManager.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
