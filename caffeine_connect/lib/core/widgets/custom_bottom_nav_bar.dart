import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final bool withShadow;
  const CustomBottomNavBar({super.key, this.withShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: withShadow
            ? [
                const BoxShadow(
                  color: ColorManager.grey4,
                  blurRadius: ValuesManager.v10,
                  offset: Offset(0, ValuesManager.v5),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ValuesManager.v20),
        child: BottomNavigationBar(
          currentIndex: 0, // TODO: make it dynamic
          elevation: 0.0,
          backgroundColor: ColorManager.offWhite,
          selectedItemColor: ColorManager.secondary,
          unselectedItemColor: ColorManager.grey3,
          items: _items,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _items => const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: ValuesManager.v15),
            child: Icon(Icons.storefront_outlined),
          ),
          label: StringsManager.empty,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: ValuesManager.v15),
            child: Icon(Icons.shopify),
          ),
          label: StringsManager.empty,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: ValuesManager.v15),
            child: Icon(Icons.history_edu_outlined),
          ),
          label: StringsManager.empty,
        ),
      ];
}
