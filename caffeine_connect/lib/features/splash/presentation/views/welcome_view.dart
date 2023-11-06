import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/splash/presentation/views/widgets/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: Constants.welceomScreenDelayInSeconds),
      () {
        navigateTo(
          context: context,
          dest: RoutesManager.loginView,
          replace: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // lottie coffee cup
            AspectRatio(
              aspectRatio: 1,
              child: Lottie.asset(
                AssetsManager.animated_coffee_cup,
                width: width * 0.5,
              ),
            ),
            const MaxGap(ValuesManager.v10),

            // welcome text 1
            CustomAnimatedText(
              begin: const Offset(-2, 0),
              end: const Offset(0, 0),
              duration: Duration(seconds: Constants.textAnimationDuration),
              child: Text(
                StringsManager.welcomeText1,
                style: Styles.textStyle22.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.secondary,
                ),
              ),
            ),

            const MaxGap(ValuesManager.v10),

            // welcome text 2
            CustomAnimatedText(
              begin: const Offset(2, 0),
              end: const Offset(0, 0),
              duration: Duration(seconds: Constants.textAnimationDuration),
              child: Text(
                StringsManager.welcomeText2,
                style: Styles.textStyle22.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
