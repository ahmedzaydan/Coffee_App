import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({
    super.key,
    required this.image,
    this.height = ValuesManager.v30,
    this.width = ValuesManager.v30,
    this.color = ColorManager.grey3,
  });
  final String image;
  final double height;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.image,
    this.aspectRatio = 1.5,
    this.height,
    this.width,
    this.borderRadius = ValuesManager.v15,
    this.fit = BoxFit.cover,
  });
  final String image;
  final double aspectRatio;
  final double? height;
  final double? width;
  final double borderRadius;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit,
          height: height,
          width: width,
        ),
      ),
    );
  }
}

class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage({
    super.key,
    required this.image,
    this.aspectRatio = 1.5,
    this.height,
    this.width,
    this.borderRadius = ValuesManager.v15,
    this.fit = BoxFit.cover,
    this.color,
  });
  final String image;
  final double aspectRatio;
  final double? height;
  final double? width;
  final double borderRadius;
  final BoxFit fit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          image,
          fit: fit,
          color: color,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
