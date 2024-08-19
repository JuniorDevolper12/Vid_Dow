import 'package:flutter/material.dart';

import '../Audios Bars/Audiobars.dart';

class Barcontainer extends StatefulWidget {
  final bool isplaying;

  const Barcontainer({super.key, required this.isplaying});

  @override
  State<Barcontainer> createState() => _BarcontainerState();
}

class _BarcontainerState extends State<Barcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Bars(
              isplaying: widget.isplaying,
              h: 30,
              w: 10,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Bars(
              isplaying: widget.isplaying,
              h: 50,
              w: 10,
            ),
          ),
          Bars(
            isplaying: widget.isplaying,
            h: 80,
            w: 10,
          ),
          Bars(
            isplaying: widget.isplaying,
            h: 80,
            w: 10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Bars(
              isplaying: widget.isplaying,
              h: 100,
              w: 10,
            ),
          ),
          Bars(
            isplaying: widget.isplaying,
            h: 80,
            w: 10,
          ),
          Bars(
            isplaying: widget.isplaying,
            h: 80,
            w: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Bars(
              isplaying: widget.isplaying,
              h: 50,
              w: 10,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Bars(
              isplaying: widget.isplaying,
              h: 30,
              w: 10,
            ),
          ),
        ],
      ),
    );
  }
}
