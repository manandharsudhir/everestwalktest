import 'package:everestwalktest/core/configs/style/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/spacing_size.dart';

class PaginatedErrorWidget extends StatelessWidget {
  final String title;
  const PaginatedErrorWidget({
    super.key,
    required this.widget,
    this.title = "Something Went Wrong!",
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget,
        PaginatedErrorItemWidget(isFirst: false, title: title),
      ],
    );
  }
}

class PaginatedErrorItemWidget extends StatelessWidget {
  const PaginatedErrorItemWidget({
    super.key,
    this.isFirst = false,
    this.title = "Something Went Wrong!",
  });
  final bool isFirst;
  final String title;
  @override
  Widget build(BuildContext context) {
    return isFirst
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: AppTextStyle.heading6,
                ),
              ],
            ),
          )
        : Column(
            children: [
              const Icon(Icons.info),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: AppTextStyle.heading6,
              ),
              Spacing.sizedBoxH_32(),
            ],
          );
  }
}
