import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Grinding extends StatelessWidget {
  const Grinding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          StringsManager.grinding,
          style: Styles.textStyle14,
        ),
        const Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/grinding_image.svg',
                height: AppValues.v30,
                width: AppValues.v30,
                colorFilter: const ColorFilter.mode(
                  ColorManager.grey3,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppValues.v10),
              SvgPicture.asset(
                'assets/images/grinding_image.svg',
                height: AppValues.v45,
                width: AppValues.v45,
                colorFilter: const ColorFilter.mode(
                  ColorManager.black1,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
