import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/decorated_text.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/quantitiy_widget.dart';
import 'package:flutter/material.dart';

class NameAndCount extends StatelessWidget {
  const NameAndCount({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DecoratedText(name: item.name),
        const QuantityWidget(),
      ],
    );
  }
}
