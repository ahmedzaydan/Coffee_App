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
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GreenRectangle(width: width),
            Expanded(child: Section2(width: width)),
          ],
        ),
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
            style: Styles.textStyle18.copyWith(color: ColorManager.grey2),
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

class GreenRectangle extends StatelessWidget {
  const GreenRectangle({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: ValuesManager.v120,
        bottom: ValuesManager.v30,
      ),
      padding: const EdgeInsets.all(ValuesManager.v20),
      width: double.infinity,
      height: ValuesManager.v350,
      color: ColorManager.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          const CustomCachedNetworkImage(
            image: AssetsManager.logo,
            width: ValuesManager.v200,
            height: ValuesManager.v200,
            borderRadius: ValuesManager.v0,
          ),
          const Gap(ValuesManager.v30),

          // text
          Text(
            StringsManager.magicCoffee,
            style: TextStyle(
              fontFamily: Constants.reenieBeanie,
              fontSize: width * 0.18,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}
