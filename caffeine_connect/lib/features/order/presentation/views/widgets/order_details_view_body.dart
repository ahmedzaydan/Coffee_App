import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/next_button.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/order_image.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/order_options_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.item});
  final MenuItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.v18),
      child: Column(
        children: [
          OrderImage(image: item.image),
          const SizedBox(height: AppValues.v10),
          OrderOptions(item: item),
          const CoffeeLoverAssemblage(),
          const SizedBox(height: AppValues.v15),
          const TotalPrice(price: 5.00), // TODO: get price from cubit
          const SizedBox(height: AppValues.v15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppValues.v5),
            child: NextButton(),
          ),
        ],
      ),
    );
  }
}
