import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

class Bars extends StatelessWidget {
  final bool isplaying;
  final double h;
  final double w;

  const Bars(
      {super.key, required this.isplaying, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return MiniMusicVisualizer(
      shadows: const [BoxShadow(color: Colors.yellow)],
      animate: isplaying,
      radius: 50,
      color: Colors.red,
      width: 10,
      height: h,
    );
  }
}
