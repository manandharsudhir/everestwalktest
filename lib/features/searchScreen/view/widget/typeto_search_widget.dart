import 'package:flutter/material.dart';

import '../../../../core/configs/spacing_size.dart';
import '../../../../core/configs/style/text_styles.dart';

class TypetoSearchWidget extends StatelessWidget {
  const TypetoSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.search,
          color: Colors.white,
          size: 80,
        ),
        Spacing.sizedBoxH_16(),
        const Text(
          "Start typing to search",
          style: AppTextStyle.heading6,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
