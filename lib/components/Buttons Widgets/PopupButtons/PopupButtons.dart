import 'package:flutter/material.dart';

class Downloadoptions extends StatelessWidget {
  final VoidCallback onpause;
  final VoidCallback oncancel;

  const Downloadoptions(
      {super.key, required this.onpause, required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          // PopupMenuItem<String>(
          //   value: 'Pause',
          //   child: InkWell(
          //     onTap: onpause,
          //     child: Row(
          //       children: [
          //         Icon(Icons.pause),
          //         Text('Pause'),
          //       ],
          //     ),
          //   ),
          // ),
          PopupMenuItem<String>(
            value: 'Cancel',
            child: InkWell(
              onTap: oncancel,
              child: const Row(
                children: [
                  Icon(Icons.cancel),
                  Text('Cancel'),
                ],
              ),
            ),
          ),
        ];
      },
      onSelected: (String value) {},
    );
  }
}
