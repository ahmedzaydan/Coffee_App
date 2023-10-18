import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:flutter/material.dart';

class GridViewMenuItem extends StatelessWidget {
  final MenuItem item;
  const GridViewMenuItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: GestureDetector(
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
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  height: ValuesManager.v100, // TODO: change to responsive
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
      ),
    );
  }
}
