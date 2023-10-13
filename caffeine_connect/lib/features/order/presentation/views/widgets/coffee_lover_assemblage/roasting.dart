import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Roasting extends StatelessWidget {
  const Roasting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          StringsManager.roasting,
          style: Styles.textStyle14,
        ),
        Spacer(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // one flame
              FlameWidget(child: FlameIconsList(count: 1)),

              // two flames
              FlameWidget(child: FlameIconsList(count: 2)),

              // three flames
              FlameWidget(
                child: Column(
                  children: [
                    FlameIconsList(count: 1),
                    FlameIconsList(count: 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FlameWidget extends StatelessWidget {
  const FlameWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: toggle the color
      },
      child: child,
    );
  }
}

class FlameIconsList extends StatelessWidget {
  const FlameIconsList({
    super.key,
    required this.count,
    this.color = ColorManager.grey3,
  });
  final int count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < count; i++) ...[
          FaIcon(
            FontAwesomeIcons.fireFlameCurved,
            color: color,
          ),
          if (count > 1) const SizedBox(width: AppValues.v5),
        ]
      ],
    );
  }
}
