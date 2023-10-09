import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class GridViewMenuItem extends StatelessWidget {
  final String image;
  final String name;
  final void Function()? onTap;
  const GridViewMenuItem({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.offWhite,
            borderRadius: BorderRadius.circular(AppValues.v15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // item image
              SizedBox(
                width: AppValues.v140,
                height: AppValues.v100,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: AppValues.v100,
                  width: AppValues.v140,
                ),
              ),

              const SizedBox(height: AppValues.v10),

              // item name
              Text(
                name,
                style: Styles.textStyle14.copyWith(
                  color: ColorManager.black1,
                  fontFamily: Constants.dmSans,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
