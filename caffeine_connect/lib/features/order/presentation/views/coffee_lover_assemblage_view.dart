import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/coffee_type.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/grinding.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/ice.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/milk_syrup.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/roasting.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_list_tile.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/next_button.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/total_price.dart';
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
        padding: const EdgeInsets.all(ValuesManager.v25),
        child: SingleChildScrollView(
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
              const VerticalSeparator(bottom: ValuesManager.v0),
              // coffee sort
              CustomListTile(
                title: StringsManager.coffeeSort,
                onTap: () {
                  // TODO: go to coffee sort screen
                },
              ),
              const VerticalSeparator(top: ValuesManager.v0),
              const Roasting(),
              const VerticalSeparator(),
              const Grinding(),
              const VerticalSeparator(),
              const MilkSyrup(),
              const VerticalSeparator(bottom: ValuesManager.v0),
              // additives
              CustomListTile(
                title: StringsManager.additives,
                onTap: () {
                  // TODO: go to coffee sort screen
                },
              ),
              const VerticalSeparator(
                top: ValuesManager.v0,
                bottom: ValuesManager.v15,
              ),
              const Ice(),
              const VerticalSeparator(top: ValuesManager.v15),
              const TotalPrice(price: 9.00),
              const SizedBox(height: ValuesManager.v20),
              const NextButton(), // TODO: (go to my order screen)
            ],
          ),
        ),
      ),
    );
  }
}
