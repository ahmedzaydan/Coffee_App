import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
