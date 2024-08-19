import 'package:shared_preferences/shared_preferences.dart';

class Langaugegetter {
  static Future<String?> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language');
  }
}
