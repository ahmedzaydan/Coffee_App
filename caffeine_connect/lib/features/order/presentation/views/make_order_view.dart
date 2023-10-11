import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/make_order_view_body.dart';
import 'package:flutter/material.dart';

class MakeOrderView extends StatelessWidget {
  final MenuItem item;
  const MakeOrderView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context: context,
        title: StringsManager.order,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.v25),
          child: MakeOrderViewBody(item: item),
        ),
      ),
    );
  }
}
