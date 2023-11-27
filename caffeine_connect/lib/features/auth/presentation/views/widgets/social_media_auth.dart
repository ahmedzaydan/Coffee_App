import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({super.key});
  final double value = 60;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // google button
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(value / 2),
            ),
            minWidth: value,
            height: value,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Image.asset(
              AssetsManager.googleLogo,
              height: 60,
              width: 60,
            ),
          ),
          // google button
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(value / 2),
            ),
            minWidth: value,
            height: value,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Image.asset(
              AssetsManager.facebookLogo,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
        