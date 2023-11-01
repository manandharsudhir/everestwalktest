import 'package:flutter/material.dart';

import '../../../core/configs/style/colors.dart';
import '../../../core/configs/style/text_styles.dart';

class MovieVoteWidget extends StatelessWidget {
  const MovieVoteWidget({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: (voteAverage) / 10,
            backgroundColor: Palette.primaryColor,
            strokeWidth: 5,
            strokeCap: StrokeCap.round,
            color: Palette.white,
          ),
          SizedBox(
            child: Center(
              child: Text(
                "${((voteAverage) * 10).round()}%",
                style: AppTextStyle.heading6.copyWith(
                  shadows: [
                    const Shadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
