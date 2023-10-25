import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/coffee_lover_assemblage_view_body.dart';
import 'package:caffeine_connect/features/order/presentation/views/select_barista_view.dart';
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
      body: screens[0], // TODO: use cubit to change screens
    );
  }
}

List<Widget> screens = [
  const CoffeeLoverAssemblageViewBody(),
  const SelectBaristaView(),
];
