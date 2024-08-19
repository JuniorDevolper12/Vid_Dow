import 'package:flutter/material.dart';

class AdbannerWidget extends StatelessWidget {
  const AdbannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: const Image(
        image: AssetImage(
          'images/Capture-removebg-preview.png',
        ),
      ),
    );
  }
}
