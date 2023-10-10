import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/decorated_text.dart';
import 'package:flutter/material.dart';

class Volume extends StatelessWidget {
  const Volume({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DecoratedText(name: StringsManager.volume),
        Spacer(),
        CupWithSize(
          cupSize: 20,
          cupCapacity: 250,
          cupColor: ColorManager.grey4,
        ),
        SizedBox(width: AppValues.v10),
        CupWithSize(
          cupSize: 30,
          cupCapacity: 350,
          cupColor: ColorManager.black1,
        ),
        SizedBox(width: AppValues.v10),
        CupWithSize(
          cupSize: 40,
          cupCapacity: 450,
          cupColor: ColorManager.grey4,
        ),
      ],
    );
  }
}

class CupWithSize extends StatelessWidget {
  final double cupSize;
  final int cupCapacity;
  final Color? cupColor;
  const CupWithSize({
    super.key,
    required this.cupSize,
    required this.cupCapacity,
    this.cupColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // cup
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.local_drink_outlined,
            size: cupSize,
            color: cupColor,
          ),
        ),

        // capacity
        Text(
          '$cupCapacity',
          style: Styles.textStyle14.copyWith(
            color: cupColor,
          ),
        ),
      ],
    );
  }
}
