import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Centreimage extends StatelessWidget {
  const Centreimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Get.height * 0.035),
      child: SizedBox(
          height: Get.height * 0.3,
          width: Get.width * 1,
          child: const Image(
            image: AssetImage('images/Center.png'),
          )),
    );
  }
}
