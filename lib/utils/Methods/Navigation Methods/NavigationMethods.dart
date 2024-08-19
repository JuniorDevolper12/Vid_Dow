import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeScreen {
  final transition = Transition.leftToRight;
  Duration duration = Duration(milliseconds: 500);

  Goto(Widget Screen) {
    Get.to(Screen, transition: transition, duration: duration);
  }

  OffAll(Widget Screen) {
    Get.offAll(Screen, transition: transition, duration: duration);
  }

  offthis(
    Widget Screen,
  ) {
    Get.off(Screen, transition: transition, duration: duration);
  }
}
