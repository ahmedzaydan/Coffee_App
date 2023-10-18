import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeInputBox extends StatelessWidget {
  TimeInputBox({super.key});
  final TimeOfDay pickedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ColorManager.white2,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ValuesManager.v10),
          ),
        ),
      ),
      onPressed: () {
        _showTimeInputBox(context);
      },
      child: Text(
        pickedTime.format(context),
        style: Styles.textStyle22.copyWith(
          fontFamily: Constants.dmSans,
          color: ColorManager.black,
        ),
      ),
    );
  }
}

Future<void> _showTimeInputBox(context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: ColorManager.secondary,
          ),
        ),
        child: child!,
      );
    },
  );
  if (pickedTime != null) {
    if (kDebugMode) {
      print('pickedTime: ${pickedTime.format(context)}');
    }
  }
}
