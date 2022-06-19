import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
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
    this.color,
  }) : super(key: key);

  final String imagePath;
  final double width;
  final double height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,
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
    this.color,
  }) : super(key: key);

  final String iconPath;
  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CommonAssetImage(
      imagePath: iconPath,
      height: height,
      width: width,
      color: color,
      fit: BoxFit.fill,
    );
  }
}

class CommonAvatar extends StatelessWidget {
  const CommonAvatar({
    Key? key,
    this.photoUrl,
    this.radius = 40,
    this.height = 80,
    this.width = 80,
    this.padding = 0,
  }) : super(key: key);

  final String? photoUrl;
  final double radius;
  final double height;
  final double width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: colorLightGray1,
          width: 2.0,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: colorWhite,
        backgroundImage: photoUrl != null
            ? CachedNetworkImageProvider(
                photoUrl!,
              )
            : null,
        child: photoUrl == null
            ? const CommonAssetIcon(
                iconPath: AssetPaths.icUser,
                color: colorBlack54,
              )
            : null,
      ),
    );
  }
}
