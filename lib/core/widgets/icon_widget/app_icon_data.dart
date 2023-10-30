import 'package:flutter/material.dart';

import '../../configs/style/colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.icon, this.size = 18, this.color})
      : super(key: key);

  final double size;
  final AppIconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          icon.imageIcon,
          height: size,
          width: size,
          color: color ?? Palette.text02,
        ),
      ),
    );
  }
}

class AppIconData {
  const AppIconData(this.imageIcon);
  final String imageIcon;
}
