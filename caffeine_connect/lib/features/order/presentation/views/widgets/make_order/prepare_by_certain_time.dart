import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/time_input_box.dart';
import 'package:flutter/material.dart';

class PrepareByCertainTime extends StatelessWidget {
  const PrepareByCertainTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              StringsManager.prepareByCertainTime,
              style: Styles.textStyle14,
            ),
            const Spacer(),
            Switch(
              value: true, // TODO: get value from cubit
              onChanged: (value) {},
              activeColor: ColorManager.green,
              inactiveTrackColor: ColorManager.grey3,
            ),
          ],
        ),
        const SizedBox(height: ValuesManager.v5),
        Align(
          alignment: Alignment.centerRight,
          child: TimeInputBox(),
        ),
      ],
    );
  }
}
