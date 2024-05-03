import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_images.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GreenRectangle(height: height * 0.5),
            Expanded(child: Section2(width: width)),
          ],
        ),
      ),
    );
  }
}

class GreenRectangle extends StatelessWidget {
  const GreenRectangle({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: height * 0.2,
        bottom: height * 0.06,
      ),
      padding: const EdgeInsets.all(ValuesManager.v20),
      width: double.infinity,
      height: height + height * 0.03,
      color: ColorManager.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          CustomCachedNetworkImage(
            image: AssetsManager.logo,
            width: height * 0.6,
            height: height * 0.6,
            borderRadius: ValuesManager.v0,
          ),

          // Magic coffee text
          Text(
            StringsManager.magicCoffee,
            style: TextStyle(
              fontFamily: Constants.reenieBeanie,
              fontSize: height * 0.15,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ValuesManager.v10),
      child: Column(
        children: [
          Text(
            StringsManager.welcomeText1,
            style: TextStyle(
              fontSize: width * 0.08,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            StringsManager.welcomeText2,
            style: Styles.textStyle18.copyWith(
              color: ColorManager.grey2,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: ForwardButton(
              onPressed: () {
                navigateTo(
                  context: context,
                  dest: RoutesManager.loginView,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
