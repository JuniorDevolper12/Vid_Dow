import 'package:flutter/material.dart';

Widget PlayerControls(
    BuildContext,
    VoidCallback onplayorpause,
    VoidCallback onnext,
    VoidCallback onback,
    bool isplaying,
    VoidCallback onloop,
    bool islooping) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Controls(BuildContext, onloop,
          islooping ? Icons.repeat_on_outlined : Icons.repeat),
      Controls(BuildContext, onback, Icons.skip_previous_outlined),
      Controls(BuildContext, onplayorpause,
          isplaying ? Icons.pause : Icons.play_arrow),
      Controls(BuildContext, onnext, Icons.skip_next_outlined)
    ],
  );
}

Widget Controls(BuildContext, VoidCallback ontap, IconData icons) {
  return IconButton(
    onPressed: ontap,
    icon: Icon(
      icons,
      size: 40,
      color: Colors.blue,
    ),
  );
}
