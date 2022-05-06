import 'package:flutter/material.dart';

class CommonAssetImage extends StatelessWidget {
  const CommonAssetImage({
    Key? key,
    required this.imagePath,
    this.width = 200,
    this.height = 200,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
  }) : super(key: key);

  final String imagePath;
  final double width;
  final double height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      excludeFromSemantics: true,
    );
  }
}

class CommonAssetIcon extends StatelessWidget {
  const CommonAssetIcon({
    Key? key,
    required this.iconPath,
    this.height = 24,
    this.width = 24,
  }) : super(key: key);

  final String iconPath;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CommonAssetImage(
      imagePath: iconPath,
      height: height,
      width: width,
      fit: BoxFit.fill,
    );
  }
}
