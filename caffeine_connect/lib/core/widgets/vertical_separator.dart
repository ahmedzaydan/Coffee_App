import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  final double top;
  final double bottom;
  const VerticalSeparator({
    super.key,
    this.top = AppValues.v10,
    this.bottom = AppValues.v10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Container(
        width: double.infinity,
        height: AppValues.v2,
        color: ColorManager.white2,
      ),
    );
  }
}
