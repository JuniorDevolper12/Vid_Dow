import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Toasthelper {
  static Showtoast(String title) {
    Fluttertoast.showToast(
      msg: title.tr,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
