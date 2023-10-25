import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdditivesView extends StatelessWidget {
  const AdditivesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context: context,
        title: StringsManager.additives,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ValuesManager.v10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: ValuesManager.v10),
            Text(
              StringsManager.selectAdditives,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: ValuesManager.v25),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (kDebugMode) print("${additives[index]} choosen");
                    },
                    child: Text(
                      additives[index],
                      style: Styles.textStyle16.copyWith(
                        fontFamily: Constants.dmSans,
                        color: (index == 0 || index == 3)
                            ? ColorManager.blue
                            : Colors.black,
                        // TODO: change color based on selection value
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const VerticalSeparator(),
                itemCount: additives.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> additives = [
  StringsManager.ceylonCinnamon,
  StringsManager.gratedChocolate,
  StringsManager.liquidChocolate,
  StringsManager.marshmallow,
  StringsManager.whippedCream,
  StringsManager.cream,
  StringsManager.nutmeg,
  StringsManager.iceCream,
];
