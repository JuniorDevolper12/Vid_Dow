import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  final String icon;

  const CustomIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      size: 19,
      AssetImage(
        icon,
      ),
    );
  }
}
