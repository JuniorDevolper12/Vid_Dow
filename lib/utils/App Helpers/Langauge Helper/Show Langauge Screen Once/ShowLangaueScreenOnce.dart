import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeBoolToSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('show', true);
}
