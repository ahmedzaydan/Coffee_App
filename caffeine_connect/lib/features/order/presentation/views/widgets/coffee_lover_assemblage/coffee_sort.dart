import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoffeeSortView extends StatelessWidget {
  const CoffeeSortView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context: context,
        title: StringsManager.coffeeSort,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ValuesManager.v10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: ValuesManager.v10),
            Text(
              StringsManager.selectCoffeeSort,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: ValuesManager.v25),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (kDebugMode) print("${coffeeSorts[index]} choosen");
                    },
                    child: Text(
                      coffeeSorts[index],
                      style: Styles.textStyle16.copyWith(
                        fontFamily: Constants.dmSans,
                        color: index == 0 ? ColorManager.blue : Colors.black,
                        // TODO: change color based on selection value
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const VerticalSeparator(),
                itemCount: coffeeSorts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> coffeeSorts = [
  StringsManager.santos,
  StringsManager.bourbonSantos,
  StringsManager.minas,
  StringsManager.rio,
  StringsManager.canilon,
  StringsManager.flatBeat,
];
