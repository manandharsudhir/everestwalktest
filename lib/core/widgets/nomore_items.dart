import 'package:flutter/material.dart';

class NoMoreItems extends StatelessWidget {
  const NoMoreItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        "No More Items Found!",
        textAlign: TextAlign.center,
      ),
    );
  }
}
