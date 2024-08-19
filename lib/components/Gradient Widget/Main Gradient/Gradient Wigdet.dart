import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GradientColor extends StatelessWidget {
  final Widget? child;
  const GradientColor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          HexColor('F2E7FA'),
          HexColor('F2E7FA'),
          HexColor('DCF8FA'),
          HexColor('EAFAE7'),
          HexColor('FFF0D9'),
        ], stops: const [
          0,
          0,
          30,
          74,
          100
        ])),
        child: child);
  }
}
