import 'package:flutter/material.dart';

import '../configs/style/colors.dart';
import '../configs/style/text_styles.dart';
import 'button/primary_btn.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key,
      required this.func,
      required this.title,
      this.showButton = true});
  final String title;
  final VoidCallback func;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.heading5,
            ),
          ),
          PrimaryButton(
            text: "View All",
            func: func,
            btnColor: Colors.transparent,
            textColor: Palette.primaryColor,
          )
        ],
      ),
    );
  }
}
