import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/barista_model.dart';
import 'package:flutter/material.dart';

class SelectBaristaView extends StatelessWidget {
  const SelectBaristaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context: context,
        title: StringsManager.coffeeLoverAssemblage,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ValuesManager.v20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringsManager.selectBarista,
              style: Styles.textStyle16,
            ),

            const SizedBox(height: ValuesManager.v20),
            // baristas list
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: ValuesManager.v10);
                },
                itemBuilder: (context, index) {
                  return BaristaItem(barista: baristas[index]);
                },
                itemCount: baristas.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: make all images cached network image instead of asset image
class BaristaItem extends StatelessWidget {
  const BaristaItem({super.key, required this.barista});
  final Barista barista;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ValuesManager.v10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: ValuesManager.v10,
            offset: const Offset(0, 3),
          ),
        ],
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(ValuesManager.v10),
      ),
      child: Row(
        children: [
          // image
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ValuesManager.v16),
              child: AspectRatio(
                aspectRatio: 1.5,
                child: CachedNetworkImage(
                  imageUrl: barista.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(width: ValuesManager.v10),

          // name + rating
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                Text(
                  barista.name,
                  style: Styles.textStyle16,
                ),

                // rating
                if (barista.rating != null)
                  Text(
                    barista.rating!,
                    style: Styles.textStyle16,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Barista barista = Barista(
  name: StringsManager.baristaName,
  image: AssetsManager.baristaImage,
  rating: StringsManager.baristaRating,
);

List<Barista> baristas = [
  barista,
  barista,
  barista,
];
