import 'package:get/get.dart';

class Snackbarhelper {
  static void Showsnackbar(String Heading, String msg) {
    Get.snackbar(Heading.tr, msg.tr,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 800));
  }
}
