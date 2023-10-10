import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_app_bar.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/order_details_view_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  final MenuItem item;
  const OrderDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppValues.v5,
            vertical: AppValues.v25,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: StringsManager.order,
                sourceContext: context,
              ),
              OrderDetailsViewBody(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
