import 'package:flutter/material.dart';

class PaginatedEmptyWidget extends StatelessWidget {
  const PaginatedEmptyWidget({super.key, required this.func});

  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: func,
            icon: const Icon(Icons.replay),
          ),
          const Chip(
            label: Text("No items Found!"),
          ),
        ],
      ),
    );
  }
}
