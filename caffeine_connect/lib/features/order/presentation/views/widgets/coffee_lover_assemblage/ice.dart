import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class Ice extends StatelessWidget {
  const Ice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          StringsManager.ice,
          style: Styles.textStyle14,
        ),
        Spacer(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIcon(child: IceQube()),
              CustomIcon(count: 2, child: IceQube()),
              CustomIcon(count: 3, child: IceQube()),
            ],
          ),
        ),
      ],
    );
  }
}

class IceQube extends StatelessWidget {
  final Color color;
  const IceQube({
    super.key,
    this.color = ColorManager.grey3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.v5),
        color: ColorManager.transparent,
        border: Border.all(
          width: AppValues.v2,
          color: color,
        ),
      ),
      width: AppValues.v20,
      height: AppValues.v20,
    );
  }
}
