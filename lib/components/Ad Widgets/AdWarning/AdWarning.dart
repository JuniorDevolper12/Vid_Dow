import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdWarning extends StatelessWidget {
  const AdWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Get.height * 0.1),
        child: Opacity(
          opacity: 0.5,
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText('This Action Contains Ad',
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSauceOne'),
                  duration: const Duration(seconds: 50),
                  textAlign: TextAlign.center),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 50),
          ),
        ));
  }
}
