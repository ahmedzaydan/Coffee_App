import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:caffeine_connect/features/splash/presentation/views/widgets/welcom_image.dart';
import 'package:caffeine_connect/features/splash/presentation/views/widgets/welcom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeImage(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.v20,
                vertical: height * 0.05,
              ),
              child: const WelcomeText(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: height * 0.03,
                  right: AppValues.v30,
                ),
                child: ForwardButton(
                  onPressed: () => navigateTo(
                      context: context, dest: RoutesManager.loginView),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
