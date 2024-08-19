import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/App Helpers/Snackbar/ShowSnackbar.dart';
import '../../utils/App Helpers/Toast Helper/ToastHelper.dart';

class WebViewProvider extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  final WebViewController _controller = WebViewController();

  bool validurl = false;
  bool _isloading = false;
  final bool _isTyping = false;
  String _search = '';
  String? _downloadUrl = '';
  String _searchengine = 'google';
  double _progress = 0.0;
  final FocusNode _focusNode = FocusNode();

  FocusNode get focusenode => _focusNode;

  WebViewController get controller => _controller;

  bool get isTyping => _isTyping;

  bool get isloading => _isloading;

  String get search => _search;

  String? get downloadUrl => _downloadUrl;

  String get searchengine => _searchengine;

  TextEditingController get WebSeacrhController => _searchController;

  double get progress => _progress;

  onchanged(String v) {
    _searchController.text = v;
    notifyListeners();
  }

  removetext() {
    _searchController.text = '';
    notifyListeners();
  }

  Future<void> initializeWebView(String initialUrl) async {
    await _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _controller.setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (change) {
          _searchController.text = change.url!;
          _downloadUrl = change.url;
          notifyListeners();
        },
        onProgress: (int progress) {
          _progress = progress / 100;
          _isloading = progress < 100;
          notifyListeners();
        },
        onPageStarted: (String url) {
          _isloading = true;
          notifyListeners();
        },
        onPageFinished: (String url) {
          _isloading = false;
          getcurrenturl();
          notifyListeners();
        },
        onWebResourceError: (WebResourceError error) {
          print('Web Resource Error: ${error.description}');
        },
      ),
    );
    await _controller.loadRequest(Uri.parse(getUrl(initialUrl)));
  }

  Future<void> ChangeSearchEngine(String newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('engine', newValue);
    await prefs.reload();
    _searchengine = newValue;
    notifyListeners();
    Snackbarhelper.Showsnackbar('Search Engine', newValue.capitalize());
  }

  void getengine() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    _searchengine = prefs.getString('engine') ?? 'google';
    notifyListeners();
  }

  void changesearchengine(String newengine) {
    _searchengine = newengine;
    notifyListeners();
    Snackbarhelper.Showsnackbar('Search Engine', newengine.capitalize());
  }

  void disposeController() {
    _searchController.dispose();
  }

  void closetab(BuildContext context) {
    _isloading = false;
    disposeController();
    notifyListeners();
  }

  void setSearch(String value) {
    _search = value;
    notifyListeners();
  }

  Future<void> checkurl(String urlcheck) async {
    try {
      final result = await InternetAddress.lookup(urlcheck);
      validurl = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      validurl = false;
    }
  }

  IconData getSearchEngineIcon() {
    getengine();
    switch (_searchengine.toLowerCase()) {
      case 'google':
        return Bootstrap.google;
      case 'bing':
        return Bootstrap.bing;
      case 'yahoo':
        return Bootstrap.search;
      default:
        return Bootstrap.google;
    }
  }

  GotoSearch(String Search) async {
    await _controller.loadRequest(Uri.parse(getUrl(Search)));
  }

  Future<void> getcurrenturl() async {
    _downloadUrl = await _controller.currentUrl();
    notifyListeners();
  }

  String getUrl(String url) {
    checkurl(url);
    getengine();
    if (url.contains('www') ||
        url.contains('https') ||
        url.contains('.com') ||
        validurl) {
      return url;
    } else {
      switch (_searchengine) {
        case 'google':
          return 'https://www.google.com/search?q=$url';
        case 'bing':
          return 'https://www.bing.com/search?q=$url';
        case 'yahoo':
          return 'https://search.yahoo.com/search?p=$url';
        default:
          return 'https://www.google.com/search?q=$url';
      }
    }
  }

  // New WebView plugin functions

  Future<void> goBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  Future<void> goForward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  Future<void> reload() async {
    Toasthelper.Showtoast('Reloading.....');
    await _controller.reload();
  }

  Future<void> clearCache() async {
    await _controller.clearCache();
    await _controller.clearLocalStorage();
    clearAppCache();
  }

  Future<void> stopLoading() async {}

  Future<void> evaluateJavascript(String script) async {
    await _controller.runJavaScript(script);
  }

  Future<void> setUserAgent(String userAgent) async {
    await _controller.setUserAgent(userAgent);
  }

  Future<void> enableZoom(bool enable) async {
    await _controller.enableZoom(enable);
  }

  Future<void> clearAppCache() async {
    try {
      final cacheDir = await getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }
      cacheDir.createSync();
      Snackbarhelper.Showsnackbar('Cache', 'Cache Cleared');
    } catch (e) {
      print('Error clearing cache: $e');
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
