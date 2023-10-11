import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CoffeeLoverAssemblage extends StatelessWidget {
  const CoffeeLoverAssemblage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.v16),
        gradient: const LinearGradient(
          colors: [ColorManager.pink2, ColorManager.pink1],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Padding(
          padding: EdgeInsets.only(left: AppValues.v8),
          child: Icon(
            Icons.display_settings_outlined,
            color: ColorManager.black,
          ),
        ),
        title: Text(
          StringsManager.coffeeLoverAssemblage,
          style: Styles.textStyle14.copyWith(
            color: ColorManager.primary,
          ),
        ),
        trailing: IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: ColorManager.primary,
          ),
        ),
        onTap: () {
          navigateTo(
            dest: RoutesManager.coffeeLoverAssemblageView,
            context: context,
          );
        },
      ),
    );
  }
}
