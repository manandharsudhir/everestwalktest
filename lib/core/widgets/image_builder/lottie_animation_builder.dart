import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../configs/style/colors.dart';

class LottieAnimationWidget extends StatelessWidget {
  const LottieAnimationWidget({
    required this.url,
    this.height = 200,
    this.width = 200,
    this.fit = BoxFit.contain,
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
      child: Lottie.asset(
        url,
        fit: fit,
        height: height,
        width: width,
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
