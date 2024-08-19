import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../Interstial Ad Controller/InterstialAdController.dart';

class AdUtils {
  static void handleAdAndNavigation(
      BuildContext context, Function(BuildContext) navigateToScreen) {
    EasyDebounce.debounce(
        'Ad-Debouncer', // <-- An ID for this particular debouncer
        const Duration(milliseconds: 500), // <-- The debounce duration
        () {
      AdManager.showInterstitialAd(() => {navigateToScreen(context)},
          (p0) => {navigateToScreen(context)});
    });
  }
}
