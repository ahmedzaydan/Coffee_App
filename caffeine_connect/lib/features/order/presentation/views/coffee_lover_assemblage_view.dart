import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/coffee_type.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CoffeeLoverAssemblageView extends StatelessWidget {
  const CoffeeLoverAssemblageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context: context,
        title: StringsManager.coffeeLoverAssemblage,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppValues.v25),
        child: Column(
          children: [
            // select barista
            CustomListTile(
              title: StringsManager.selectBarista,
              onTap: () {
                // TODO: go to barista list screen
              },
            ),
            const VerticalSeparator(),
            const CoffeeType(),
            const VerticalSeparator(),
            // coffee sort
            CustomListTile(
              title: StringsManager.coffeeSort,
              onTap: () {
                // TODO: go to coffee sort screen
              },
            ),
            const VerticalSeparator(),
            // roasting
            // grind
            // milk
            // syrup
            // additives
            // ice
            // total price
            // TODO: next button (go to my order screen)
          ],
        ),
      ),
    );
  }
}
