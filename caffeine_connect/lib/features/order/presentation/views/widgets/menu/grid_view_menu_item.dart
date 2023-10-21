import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_images.dart';
import 'package:flutter/material.dart';

class GridViewMenuItem extends StatelessWidget {
  final MenuItem item;
  const GridViewMenuItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context: context,
          dest: RoutesManager.makeOrder,
          extra: item,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(ValuesManager.v15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // item image
            ClipRRect(
              borderRadius: BorderRadius.circular(ValuesManager.v15),
              child: CustomCachedNetworkImage(
                image: item.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: ValuesManager.v10),

            // item name
            Text(
              item.name,
              style: Styles.textStyle14,
            ),
          ],
        ),
      ),
    );
  }
}
