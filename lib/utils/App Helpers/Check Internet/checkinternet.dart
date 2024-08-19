import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static bool _isConnected = false;
  static bool _hasInternet = false;

  static void initConnectivity() {
    // Initialize and set up the connectivity listener
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _isConnected = results.contains(ConnectivityResult.none) ? false : true;
      _checkInternet();
    });
  }

  // Method to check current connectivity status
  static bool get isConnected => _isConnected;

  // Method to check if the internet is reachable
  static Future<void> _checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _hasInternet = true;
      } else {
        _hasInternet = false;
      }
    } on SocketException catch (_) {
      _hasInternet = false;
    }
  }

  // Method to check if there's a working internet connection
  static bool get hasInternet => _hasInternet;
}
