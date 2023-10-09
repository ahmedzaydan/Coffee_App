import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.v50),
        border: Border.all(
          color: ColorManager.grey3,
          width: AppValues.v2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // minus button
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.remove,
              size: AppValues.v18,
            ),
          ),

          // value
          Text(
            '1', // TODO: replace with value
            style: Styles.textStyle14.copyWith(
              fontFamily: Constants.dmSans,
              color: ColorManager.black1,
            ),
          ),
          // plus button
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: AppValues.v18,
            ),
          ),
        ],
      ),
    );
  }
}
