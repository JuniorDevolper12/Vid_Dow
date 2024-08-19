import 'package:flutter/material.dart';

class SpacingWidget extends StatelessWidget {
  final List<Widget> children;
  const SpacingWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          left: 8.0,
          bottom: 8.0,
          right: 8.0,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children));
  }
}
