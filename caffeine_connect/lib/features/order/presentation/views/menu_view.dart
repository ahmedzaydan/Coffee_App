import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_bottom_nav_bar.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/menu_items_grid_view.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  final String username = StringsManager.username;
  const MenuView({
    super.key,
    // required this.username,
  });
  //TODO: uncomment line above and
  // wrap when naviagate with cubit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppValues.v100,
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.primary,
        title: AppBarTitle(username: username),
        actions: _appBarActions,
      ),
      body: Container(
        padding: const EdgeInsets.all(AppValues.v25),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppValues.v25),
            topRight: Radius.circular(AppValues.v25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.selectYourCoffee,
              style: Styles.textStyle16.copyWith(
                color: ColorManager.grey3,
              ),
            ),
            const SizedBox(height: AppValues.v20),
            const Expanded(
              child: MenuItemsGridView(),
            ),
            const SizedBox(height: AppValues.v20),
            const CustomBottomNavBar(),
          ],
        ),
      ),
    );
  }
}

List<Widget> _appBarActions = [
  IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.shopping_cart_outlined,
      color: ColorManager.secondary,
    ),
  ),
  IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.person_outline,
      color: ColorManager.secondary,
    ),
  ),
  const SizedBox(width: AppValues.v10),
];

class AppBarTitle extends StatelessWidget {
  final String username;
  const AppBarTitle({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.v10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.welcome,
            style: Styles.textStyle14.copyWith(
              color: ColorManager.grey4,
            ),
          ),
          Text(
            username,
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}
