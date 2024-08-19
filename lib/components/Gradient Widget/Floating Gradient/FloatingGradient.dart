import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FloatingGradient extends StatelessWidget {
  final VoidCallback ontap;
  final bool isloading;

  const FloatingGradient(
      {super.key, required this.ontap, required this.isloading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: isloading
                  ? LinearGradient(colors: [
                      HexColor('FF9900'),
                      HexColor('FF9500'),
                      HexColor('FF8A00'),
                      HexColor('FF7800'),
                      HexColor('FF5E00'),
                      HexColor('FF3D00'),
                      HexColor('FF3300'),
                    ], stops: const [
                      0,
                      22,
                      41,
                      60,
                      78,
                      95,
                      100,
                    ])
                  : null),
          child: isloading
              ? const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: Colors.red,
                      strokeWidth: 3,
                    ),
                  ),
                )
              : Image.asset('images/DownloadIcon.png')),
    );
  }
}
