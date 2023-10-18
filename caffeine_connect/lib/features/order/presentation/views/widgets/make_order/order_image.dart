import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class OrderImage extends StatelessWidget {
  final String image;
  const OrderImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ValuesManager.v10),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ValuesManager.v12),
        color: ColorManager.offWhite,
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
