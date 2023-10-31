import 'package:flutter/material.dart';

class PaginatedLoadingWidget extends StatelessWidget {
  const PaginatedLoadingWidget({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget,
        const Center(
          child: CircularProgressIndicator(),
        ),
        const SizedBox(
          height: kToolbarHeight,
        )
      ],
    );
  }
}
