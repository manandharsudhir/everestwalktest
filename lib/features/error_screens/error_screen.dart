import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/configs/spacing_size.dart';
import '../../core/configs/style/text_styles.dart';
import '../../core/widgets/button/primary_btn.dart';
import '../../core/widgets/image_builder/lottie_animation_builder.dart';

@RoutePage()
class ErrorScreen extends HookConsumerWidget {
  final VoidCallback function;
  final String animation;
  final String title;
  final String subtitle;
  const ErrorScreen({
    super.key,
    required this.function,
    this.animation = "assets/animations/error.json",
    this.subtitle = "Try refreshing",
    this.title = "Something wrong occured",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LottieAnimationWidget(
          url: animation,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text(
                title,
                style: AppTextStyle.heading4,
                textAlign: TextAlign.center,
              ),
              Spacing.sizedBoxH_08(),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyMedium,
              ),
              Spacing.sizedBoxH_16(),
              PrimaryButton(
                text: "Refresh",
                func: function,
              ),
            ],
          ),
        )
      ],
    );
  }
}
