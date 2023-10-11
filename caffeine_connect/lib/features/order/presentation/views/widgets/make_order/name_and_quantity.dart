import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:flutter/material.dart';

class NameAndQuantity extends StatelessWidget {
  const NameAndQuantity({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.name,
          style: Styles.textStyle14,
        ),
        const Quantity(),
      ],
    );
  }
}

class Quantity extends StatelessWidget {
  const Quantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.v50),
        border: Border.all(
          color: ColorManager.grey3,
          width: AppValues.v2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // minus button
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.remove,
              size: AppValues.v18,
            ),
          ),

          // value
          const Text(
            '1', // TODO: replace with value
            style: Styles.textStyle14,
          ),
          // plus button
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: AppValues.v18,
            ),
          ),
        ],
      ),
    );
  }
}
