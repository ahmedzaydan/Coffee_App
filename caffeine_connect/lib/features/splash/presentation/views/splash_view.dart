import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: implement splash screen
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            children: [
              const Text(StringsManager.test),
              ForwardButton(
                onPressed: () {
                  navigateTo(
                    context: context,
                    dest: RoutesManager.menuView,
                    replace: true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
