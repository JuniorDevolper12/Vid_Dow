import 'package:share_plus/share_plus.dart';

import '../Toast Helper/ToastHelper.dart';

class Sharehelper {
  static Future<void> Sharefile(String path, String Filename) async {
    final result = await Share.shareXFiles([XFile(path)], text: Filename);
    if (result.status == ShareResultStatus.success) {
      Toasthelper.Showtoast('File Shared Successfully');
    }
    if (result.status == ShareResultStatus.unavailable) {
      Toasthelper.Showtoast('Invalid File');
    }
  }
}
