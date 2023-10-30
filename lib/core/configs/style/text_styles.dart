import 'package:flutter/cupertino.dart';

class AppTextStyle {
  static const TextStyle heading1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    letterSpacing: -0.5,
  );
  static const TextStyle heading2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22,
    letterSpacing: -0.6,
  );
  static const TextStyle heading3 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const TextStyle heading4 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static const TextStyle heading5 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: -0.6,
  );
  static const TextStyle heading6 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static const TextStyle subHeading1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static const TextStyle subHeading2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    letterSpacing: -0.3,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: -0.2,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle bodySmall = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
  static TextStyle button = AppTextStyle.heading6.copyWith(
    letterSpacing: 0.4,
  );
  static const TextStyle caption = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static const TextStyle overline = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );
}
