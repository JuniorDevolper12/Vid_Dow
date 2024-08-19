import 'dart:io';

import '../Snackbar/ShowSnackbar.dart';

class Deletehelper {
  static void deleteFile(String filePath) {
    final file = File(filePath);
    if (file.existsSync()) {
      print('exists');
      try {
        file.deleteSync();
        Snackbarhelper.Showsnackbar('Delete', 'Deleted Successfully');
      } catch (e) {
        Snackbarhelper.Showsnackbar('Delete', 'Could Not Delete');
      }
    } else {
      print('File does not exist.');
    }
  }
}
