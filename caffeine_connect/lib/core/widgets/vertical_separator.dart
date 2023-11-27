import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  final double top;
  final double bottom;
  final double height;
  final Color color;
  const VerticalSeparator({
    super.key,
    this.top = ValuesManager.v10,
    this.bottom = ValuesManager.v10,
    this.height = ValuesManager.v2, 
     this.color = ColorManager.white2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Container(
        width: double.infinity,
        height: height,
        color: color,
      ),
    );
  }
}
