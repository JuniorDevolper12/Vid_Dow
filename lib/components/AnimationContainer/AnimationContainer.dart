import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AnimationContainer extends StatelessWidget {
  const AnimationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.04),
      child: Lottie.asset(
        height: 300,
        width: 300,
        'images/1.json',
        fit: BoxFit.fill,
      ),
    );
  }
}
