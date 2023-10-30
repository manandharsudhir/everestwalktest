import 'package:flutter/material.dart';

import '../../configs/spacing_size.dart';
import '../../configs/style/colors.dart';
import '../../configs/style/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.borderRadius = 32,
      this.horizontalPadding = 15,
      this.verticalPadding = 15,
      required this.func,
      this.border,
      this.style,
      this.iconData,
      this.btnColor = Palette.primaryColor,
      this.textColor = Palette.white,
      this.fontSize = 14})
      : super(key: key);
  final String text;
  final Function func;
  final TextStyle? style;
  final double verticalPadding;
  final double horizontalPadding;
  final double borderRadius;
  final Border? border;
  final Color btnColor;

  final Color textColor;
  final Widget? iconData;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
            color: btnColor,
            border: border,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null ? iconData! : const SizedBox.shrink(),
            iconData != null ? Spacing.sizedBoxW_08() : const SizedBox.shrink(),
            Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: style ??
                  AppTextStyle.heading5.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
