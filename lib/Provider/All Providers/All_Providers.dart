import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Ads%20Providers/BannerAdProvider/BannerAdProvider.dart';

import '../../utils/App Helpers/Clipboard Helper/Clipboard_helper.dart';
import '../Ads Providers/Native Ad Provider/Native Ad Provider.dart';
import '../Audio Provider/AudioProvider.dart';
import '../Download Providers/Download Provider/Downloadprovider.dart';
import '../Download Providers/Downloaded Vidoes/GetDownloads.dart';
import '../ShowButton/ShowButton.dart';
import '../Walpaper Provider/WalpaperProvider.dart';
import '../WebView Provider/WebviewProvider.dart';
import '../Whatsapp Status Providers/Get Status/get_status_provider.dart';
import '../Whatsapp Status Providers/Saved Status Provider/saved_files_provider.dart';

Widget AllProviders(BuildContext context, Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GetStatusProvider()),
      ChangeNotifierProvider(create: (_) => SavedStatusProvider()),
      ChangeNotifierProvider(create: (_) => PhotosProvider()),
      ChangeNotifierProvider(create: (_) => VideoDownloadProvider()),
      ChangeNotifierProvider(create: (_) => WebViewProvider()),
      ChangeNotifierProvider(create: (_) => Clipboardhelper()),
      ChangeNotifierProvider(create: (_) => GetDownloads()),
      ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
      ChangeNotifierProvider(create: (_) => Showbutton()),
      ChangeNotifierProvider(create: (_) => SplashNativeloader()),
      ChangeNotifierProvider(create: (_) => Banneradprovider()),
    ],
    child: child,
  );
}
