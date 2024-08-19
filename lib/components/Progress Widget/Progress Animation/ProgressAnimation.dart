import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget ProgresAnimation() {
  return Align(
    alignment: Alignment.center,
    child: Lottie.asset(
      height: 150,
      width: 150,
      'images/Search.json',
      fit: BoxFit.fill,
    ),
  );
}

Widget WebProgress(double v) {
  return LinearProgressIndicator(
    value: v,
    color: Colors.red,
    minHeight: 3,
  );
}
