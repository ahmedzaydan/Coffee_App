import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // background image
          const CustomCachedNetworkImage(
            image: AssetsManager.splash,
            width: double.infinity,
            height: double.infinity,
            borderRadius: 0,
          ),

          // logo
          Positioned(
            top: height * 0.16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCachedNetworkImage(
                  image: AssetsManager.logo,
                  width: width * 0.4,
                  height: width * 0.4,
                ),

                // Magic coffee
                Text(
                  StringsManager.magicCoffee,
                  style: TextStyle(
                    fontFamily: Constants.reenieBeanie,
                    fontSize: height * 0.18,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
