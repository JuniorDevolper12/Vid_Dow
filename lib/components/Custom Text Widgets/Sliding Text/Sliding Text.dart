import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class SlidingText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;

  const SlidingText({super.key, 
    required this.text,
    required this.textStyle,
    this.duration = const Duration(seconds: 5),
  });

  @override
  _SlidingTextState createState() => _SlidingTextState();
}

class _SlidingTextState extends State<SlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextScroll(
      widget.text,
      mode: TextScrollMode.endless,
      velocity: const Velocity(pixelsPerSecond: Offset(80, 0)),
      delayBefore: const Duration(milliseconds: 10),
      pauseBetween: const Duration(milliseconds: 200),
      fadedBorder: true,
      fadedBorderWidth: 0.1,
      intervalSpaces: 100,
      style: const TextStyle(
          color: Colors.green,
          fontFamily: 'OpenSauceOne',
          fontWeight: FontWeight.w400,
          fontSize: 13),
      textAlign: TextAlign.right,
      selectable: true,
    );

    //   SizedBox(
    //   height: widget.textStyle.fontSize, // Adjust height as needed
    //   child: AnimatedBuilder(
    //     animation: _controller,
    //     builder: (context, child) {
    //       return SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         physics: NeverScrollableScrollPhysics(),
    //         child: Row(
    //           children: [
    //             SizedBox(
    //                 width: _controller.value *
    //                     100), // Adjust the multiplier as needed
    //             Text(
    //               helper.trimToLength(widget.text, 45),
    //               style: widget.textStyle,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
