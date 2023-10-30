import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({super.key, required this.func, required this.iconStr});
  final VoidCallback func;
  final String iconStr;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/icons/$iconStr",
        ),
      ),
    );
  }
}
