import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/Landing Screen/Landing_Screen.dart';

class AniminatedText extends StatelessWidget {
  const AniminatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.25),
      child: AnimatedTextKit(
        onFinished: () {
          Get.offAll(const Landing_Screen(), transition: Transition.fade);
        },
        animatedTexts: [
          TypewriterAnimatedText(
            'Your Favorite Videos, Just a Tap Away!',
            textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'OpenSauceOne'),
            speed: const Duration(milliseconds: 90),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 50),
      ),
    );
  }
}
