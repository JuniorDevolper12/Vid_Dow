import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_downloader/utils/App%20Helpers/Snackbar/ShowSnackbar.dart';
import 'package:video_downloader/view/Walpaper%20Screens/Show%20Wallpapers/Showalpapers.dart';

class PhotosProvider extends ChangeNotifier {
  List<dynamic> _photos = [];
  bool _showsearch = false;

  bool get showsearch => _showsearch;

  List<dynamic> get photos => _photos;
  final TextEditingController _SearchController = TextEditingController();

  TextEditingController get SearchController => _SearchController;

  void EnableSeach() {
    _showsearch = !_showsearch;
    notifyListeners();
  }

  void GotoSearch(String Search) {
    if (Search.isNotEmpty) {
      Get.to(Showwalpaperscreen(searchQuery: Search, appbartitle: Search));
      _showsearch = false;
      SearchController.text = '';
      notifyListeners();
    } else {
      Snackbarhelper.Showsnackbar('Wallpaper Search', 'Search Cannot Be Blank');
    }
  }

  void removesearch() {
    _SearchController.text = '';
    notifyListeners();
  }

  void turnoffSearch() {
    _showsearch = false;
    notifyListeners();
  }

  void newvalue(String value) {
    SearchController.text = value;
    notifyListeners();
  }

  Future<void> fetchPhotos(String searchTerm) async {
    final uri = Uri.parse('https://api.pexels.com/v1/search');
    final response = await http.get(
      uri.replace(queryParameters: {'per_page': '100', 'query': searchTerm}),
      headers: {
        'Authorization':
            '0d63zYTkmg817xHEPgDbKBjtebDCbSHvTSUWDVCIlNCgUL50sqe4g0lo',
        // Replace with your actual API key
      },
    );

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        _photos = data['photos'] as List<dynamic>;
        notifyListeners(); // Notify listeners (widgets) of data change
      } on FormatException catch (e) {
        print("Error parsing JSON: $e");
        _photos = []; // Set empty list on error
        notifyListeners();
      }
    } else {
      throw Exception(
          'Failed to load photos (Status Code: ${response.statusCode})');
    }
  }
}
