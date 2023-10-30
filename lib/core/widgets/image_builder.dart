import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    required this.url,
    this.size = 42,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.height,
    this.width,
    this.borderRadius,
    this.childWidget,
    this.shape = BoxShape.rectangle,
    Key? key,
  }) : super(key: key);

  final String url;
  final double? size;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadiusGeometry? borderRadius;
  final Widget? childWidget;

  /// box shape of image widget if you want to change it to circle then apply [BoxShape.circle]
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            shape: shape, borderRadius: borderRadius, color: Colors.black12),
        width: double.infinity,
        child:
            // ignore: prefer_if_null_operators
            childWidget != null
                ? childWidget
                : url.isEmpty
                    ? ImageStaticWdget(size: size)
                    : CachedNetworkImage(
                        imageUrl: url,
                        height: height,
                        width: width,
                        fit: fit,
                        placeholder: (context, url) =>
                            placeholder ?? Container(color: Colors.black12),
                        errorWidget: (context, url, error) =>
                            errorWidget ?? ImageStaticWdget(size: size)));
  }
}

class ImageStaticWdget extends StatelessWidget {
  const ImageStaticWdget({Key? key, this.size = 42}) : super(key: key);
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // logoH,
      "assets/images/logo.png",
      fit: BoxFit.contain,
      height: size,
      width: size,
    );
  }
}
