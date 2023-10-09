import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_app_bar.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/order_image.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  final MenuItem item;
  const OrderDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.v25),
        child: Column(
          children: [
            CustomAppBar(
              title: StringsManager.order,
              sourceContext: context,
            ),
            OrderImage(image: item.image),
            // name + count
            // ristretto
            // onsite/takeaway
            // volume
            // prepare by a certain time
            // time
            // coffee lover assemblage
            // total price
            // next button

          ],
        ),
      ),
    );
  }
}
