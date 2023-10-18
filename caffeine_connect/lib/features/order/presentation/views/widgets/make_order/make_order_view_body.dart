import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/coffee_lover_assemblage.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/order_image.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/order_options_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/next_button.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';

class MakeOrderViewBody extends StatelessWidget {
  const MakeOrderViewBody({super.key, required this.item});
  final MenuItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderImage(image: item.image),
        const SizedBox(height: ValuesManager.v10),
        OrderOptions(item: item),
        const CoffeeLoverAssemblage(),
        const SizedBox(height: ValuesManager.v15),
        const TotalPrice(price: 5.00), // TODO: get price from cubit
        const SizedBox(height: ValuesManager.v15),
        const NextButton(),
      ],
    );
  }
}
