import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/decorated_text.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/select_time_dialog.dart';
import 'package:flutter/material.dart';

class PrepareByCertainTime extends StatelessWidget {
  const PrepareByCertainTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const DecoratedText(name: StringsManager.prepareByCertainTime),
            const Spacer(),
            Switch(
              value: true, // TODO: get value from cubit
              onChanged: (value) {},
              activeColor: ColorManager.green,
              inactiveTrackColor: ColorManager.grey3,
            ),
          ],
        ),
        const SizedBox(height: AppValues.v5),
        Align(
          alignment: Alignment.centerRight,
          child: TimeInputBox(),
        ),
      ],
    );
  }
}
