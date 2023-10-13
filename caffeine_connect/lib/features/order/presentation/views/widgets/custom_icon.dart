import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final int count;
  final Widget child;
  const CustomIcon({
    super.key,
    this.count = 1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (count != 2) child,
        if (count > 1)
          Row(
            children: [
              for (int i = 0; i < 2; i++) ...[
                InkWell(
                  onTap: () {
                    // TODO: toggle color
                  },
                  child: child,
                ),
              ]
            ],
          ),
      ],
    );
  }
}
