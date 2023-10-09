import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  final double padding;
  const VerticalSeparator({
    super.key,
    this.padding = AppValues.v15,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Container(
        width: double.infinity,
        height: AppValues.v2,
        color: ColorManager.white2,
      ),
    );
  }
}
