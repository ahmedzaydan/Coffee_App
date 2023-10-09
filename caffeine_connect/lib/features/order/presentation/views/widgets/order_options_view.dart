import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/quantitiy_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderOptions extends StatelessWidget {
  final MenuItem item;
  const OrderOptions({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameAndCount(item: item),
        const VerticalSeparator(),
        const Ristretto(),
        const VerticalSeparator(),
        const OnsiteTakeaway(),
        const VerticalSeparator(),
        const Volume(), // TODO: get color from cubit
        const VerticalSeparator(),
        const PrepareByCertainTime(),
        // time
      ],
    );
  }
}

Text _getDecoratedText({required String name}) {
  return Text(
    name,
    style: Styles.textStyle14.copyWith(
      fontFamily: Constants.dmSans,
      color: ColorManager.black1,
    ),
  );
}

class NameAndCount extends StatelessWidget {
  const NameAndCount({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getDecoratedText(name: item.name),
        const QuantityWidget(),
      ],
    );
  }
}

class Ristretto extends StatelessWidget {
  const Ristretto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getDecoratedText(name: StringsManager.ristretto),
        const Spacer(),
        Container(
          height: AppValues.v40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.v50),
            border: Border.all(
              color: ColorManager.grey3,
              width: AppValues.v2,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.one,
              style: Styles.textStyle12.copyWith(
                fontFamily: Constants.dmSans,
                color: ColorManager.black1,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppValues.v10),
        Container(
          height: AppValues.v40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.v50),
            border: Border.all(
              color: ColorManager.grey3,
              width: AppValues.v2,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.two,
              style: Styles.textStyle12.copyWith(
                fontFamily: Constants.dmSans,
                color: ColorManager.black1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnsiteTakeaway extends StatelessWidget {
  const OnsiteTakeaway({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getDecoratedText(name: StringsManager.onsiteTakeaway),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.coffee_outlined,
            color: ColorManager.grey1, // TODO: get color from cubit
          ),
        ),
        const SizedBox(width: AppValues.v10),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.local_drink_rounded),
        ),
      ],
    );
  }
}

class Volume extends StatelessWidget {
  const Volume({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getDecoratedText(name: StringsManager.volume),
        const Spacer(),
        const CupWithSize(
          cupSize: 20,
          cupCapacity: 250,
          cupColor: ColorManager.grey4,
        ),
        const SizedBox(width: AppValues.v10),
        const CupWithSize(
          cupSize: 30,
          cupCapacity: 350,
          cupColor: ColorManager.black1,
        ),
        const SizedBox(width: AppValues.v10),
        const CupWithSize(
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

class PrepareByCertainTime extends StatelessWidget {
  const PrepareByCertainTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _getDecoratedText(name: StringsManager.prepareByCertainTime),
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

class TimeInputBox extends StatelessWidget {
  TimeInputBox({super.key});
  final DateTime selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ColorManager.white2,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.v10),
          ),
        ),
      ),
      onPressed: () {
        _showTimeInputBox(context);
      },
      child: Text(
        DateFormat('HH:mm').format(selectedTime),
        style: Styles.textStyle22.copyWith(
          fontFamily: Constants.dmSans,
          color: ColorManager.black1,
        ),
      ),
    );
  }
}

Future<void> _showTimeInputBox(context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (pickedTime != null) {
    if (kDebugMode) {
      print('pickedTime: ${pickedTime.format(context)}');
    }
  }
}
