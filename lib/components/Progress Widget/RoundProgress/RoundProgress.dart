import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget RoundProgress() {
  return Center(
    child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: const Center(
          child: Center(child: CircularProgressIndicator()),
        )),
  );
}
