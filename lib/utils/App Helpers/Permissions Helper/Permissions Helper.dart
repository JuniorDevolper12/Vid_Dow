import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Check Internet/checkinternet.dart';

class PermissionsHelper {
  static Future<void> getpermissions() async {
    ConnectivityService.initConnectivity();
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var sdkInt = androidInfo.version.sdkInt;
    if (sdkInt > 33) {
      await Permission.videos.request();
      await Permission.manageExternalStorage.request();
    } else {
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
    }
    await Permission.notification.request();
  }
}
