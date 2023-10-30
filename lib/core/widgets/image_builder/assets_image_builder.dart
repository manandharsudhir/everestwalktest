import 'package:flutter/material.dart';

import '../../configs/style/colors.dart';

class AssetImageBuilder extends StatelessWidget {
  const AssetImageBuilder({
    required this.url,
    this.height = 42,
    this.width = 42,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.errorWidget,
    this.color,
    Key? key,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? errorWidget;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  /// box shape of image widget if you want to change it to circle then apply [BoxShape.circle]
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius,
      ),
      child: Image.asset(
        url,
        fit: fit,
        height: height,
        width: width,
        color: color,
        errorBuilder: (context, object, e) {
          return Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(color: Palette.white),
            child: errorWidget,
          );
        },
      ),
    );
  }
}
