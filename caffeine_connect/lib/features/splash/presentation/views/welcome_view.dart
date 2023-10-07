import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/forward_button.dart';
import 'package:caffeine_connect/features/splash/presentation/views/widgets/welcom_text.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              // const WelcomImage(),
              // TODO: get the new design
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
                  child: const ForwardButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
