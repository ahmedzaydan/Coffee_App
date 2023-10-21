import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_images.dart';
import 'package:flutter/material.dart';

class OrderImage extends StatelessWidget {
  final String image;
  const OrderImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ValuesManager.v10),
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ValuesManager.v12),
        // color: ColorManager.offWhite,
        color: ColorManager.primary,
        // boxShadow: [
        //   BoxShadow(
        //     color: ColorManager.grey1.withOpacity(0.5),
        //     blurRadius: ValuesManager.v8,
        //     offset: const Offset(0, 2),
        //     spreadRadius: ValuesManager.v2,
        //   ),
        // ],
      ),
      child: CustomCachedNetworkImage(
        image: image,
        fit: BoxFit.contain,
      ),
    );
  }
}
