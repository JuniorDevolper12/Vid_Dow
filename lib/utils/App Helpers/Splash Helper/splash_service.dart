import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view/Dashboard Screen/dashboard_screen.dart';
import '../../../view/Langauge Screens/LangaugeScreen.dart';
import '../Navbarhelper/GowithNavbar.dart';

class GotoHome {
  static Future<void> GotoHomeorLanguage(BuildContext context) async {
    bool show = await retrieveShowValueFromSharedPreferences();
    if (show == true) {
      Navhelper.GoWithNavbar(context, const DashboardScreen());
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LanguageSelection(
                  Issetttingpage: false,
                )),
      );
    }
  }

  static Future<bool> retrieveShowValueFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('show') ?? false;
  }
}
