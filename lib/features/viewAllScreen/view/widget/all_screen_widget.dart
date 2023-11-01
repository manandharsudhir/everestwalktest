import 'package:flutter/material.dart';

class AllScreenWidget extends StatelessWidget {
  const AllScreenWidget({super.key, required this.body, required this.title});
  final Widget body;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
