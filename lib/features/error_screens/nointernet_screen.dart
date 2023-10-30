import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/configs/spacing_size.dart';
import '../../core/configs/style/text_styles.dart';
import '../../core/services/network/network_connection.dart';
import '../../core/widgets/button/primary_btn.dart';
import '../../core/widgets/image_builder/lottie_animation_builder.dart';

@RoutePage()
class NoInternetScreen extends HookConsumerWidget {
  final void Function(bool hasConnection)? onConnection;
  const NoInternetScreen({super.key, required this.onConnection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const LottieAnimationWidget(
            url: "assets/animations/nointernet.json",
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Text(
                  "Seems like there is no internet connection",
                  style: AppTextStyle.heading4,
                  textAlign: TextAlign.center,
                ),
                Spacing.sizedBoxH_08(),
                const Text(
                  "Please check your internet connection and refresh",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyMedium,
                ),
                Spacing.sizedBoxH_16(),
                PrimaryButton(
                    text: "Refresh",
                    func: () async {
                      final connection =
                          await NetworkConnectionCheck.checkConnection();
                      // onConnection?.call(connection);
                      if (onConnection != null) {
                        onConnection!(connection);
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
