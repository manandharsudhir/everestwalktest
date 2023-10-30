import 'package:flutter/material.dart';

import '../configs/spacing_size.dart';
import '../configs/style/colors.dart';
import '../configs/style/text_styles.dart';
import 'button/primary_btn.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key,
      required this.errorMsg,
      this.hasButton = false,
      required this.onBtnTapped});

  final String errorMsg;
  final VoidCallback onBtnTapped;
  final bool hasButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/error.png"),
        Spacing.sizedBoxH_16(),
        Text(
          errorMsg,
          style: AppTextStyle.heading5.copyWith(color: Palette.text01),
        ),
        Spacing.sizedBoxH_16(),
        Visibility(
          visible: hasButton,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: PrimaryButton(
              text: "Refresh",
              func: onBtnTapped,
              textColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
