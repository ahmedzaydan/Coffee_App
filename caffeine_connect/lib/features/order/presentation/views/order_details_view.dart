import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_app_bar.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/order_image.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/order_options_view.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  final MenuItem item;
  const OrderDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppValues.v25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: StringsManager.order,
                sourceContext: context,
              ),
              OrderImage(image: item.image),
              const SizedBox(height: AppValues.v10),
              OrderOptions(item: item),
              // coffee lover assemblage
              // total price
              // next button
            ],
          ),
        ),
      ),
    );
  }
}
