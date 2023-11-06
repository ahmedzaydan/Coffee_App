import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/order/data/models/order_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/custom_images.dart';
import 'package:flutter/material.dart';

// TODO: add delete dismissable feature
OrderModel orderModel = OrderModel(
  name: 'name',
  price: 3.5,
  image: AssetsManager.cappuccino,
  ristretto: 3,
  takeAway: false,
);

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
    // required this.orderModel,
  });
  // TODO: get order model from cubit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ValuesManager.v20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: ValuesManager.v5),
              child: Text(
                StringsManager.myOrder,
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: ValuesManager.v10),
                    child: OrderItem(orderModel: orderModel),
                  );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8,
      child: Container(
        padding: const EdgeInsets.all(ValuesManager.v15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ValuesManager.v15),
          color: ColorManager.offWhite,
          boxShadow: const [
            BoxShadow(
              blurRadius: ValuesManager.v5,
              color: ColorManager.grey3,
              offset: Offset(0, 2),
              spreadRadius: ValuesManager.v3,
            ),
          ],
        ),
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            CustomCachedNetworkImage(
              image: orderModel.image,
              height: ValuesManager.v120,
              width: ValuesManager.v120,
              fit: BoxFit.contain,
            ),

            // name + details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // order name
                Text(
                  orderModel.name,
                  style:
                      Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
                ),

                // order details
                // TODO: details in different screen
                Text(
                  StringsManager.orderDetails,
                  style: Styles.textStyle12.copyWith(
                    color: ColorManager.grey2,
                  ),
                ),

                // quantity
                Text(
                  'x ${orderModel.quantity}',
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorManager.blackWith57Opacity,
                  ),
                ),
              ],
            ),

            // price
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // price currency
                Text(
                  StringsManager.appCurrency,
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                ),

                // price value
                Text(
                  '${orderModel.price}',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
