import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieUtils {
  static Widget getLoadingAnimation() {
    return Lottie.asset("assets/animations/loading.json",
        height: 200, width: 200);
  }
}
