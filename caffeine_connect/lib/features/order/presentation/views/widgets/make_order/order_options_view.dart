import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/vertical_separator.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/name_and_quantity.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/onsite_takeaway.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/prepare_by_certain_time.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/ristretto.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/make_order/volume.dart';
import 'package:flutter/material.dart';

class OrderOptions extends StatelessWidget {
  final MenuItem item;
  const OrderOptions({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameAndQuantity(item: item),
        const VerticalSeparator(),
        const Ristretto(),
        const VerticalSeparator(),
        const OnsiteTakeaway(),
        const VerticalSeparator(),
        const Volume(), // TODO: get color from cubit
        const VerticalSeparator(),
        const PrepareByCertainTime(),
        const SizedBox(height: AppValues.v10),
      ],
    );
  }
}
