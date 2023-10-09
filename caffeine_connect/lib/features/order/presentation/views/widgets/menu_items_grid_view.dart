import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/grid_view_menu_item.dart';
import 'package:flutter/material.dart';

class MenuItemsGridView extends StatelessWidget {
  const MenuItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // TODO: make them responsive
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return GridViewMenuItem(item: menuItems[index]);
      },
    );
  }
}
