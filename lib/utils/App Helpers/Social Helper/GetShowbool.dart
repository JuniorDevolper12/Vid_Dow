import 'package:shared_preferences/shared_preferences.dart';

import '../../App Utils/Social Media Enum/Socialmediaenum.dart';

class SharedPreferencesHelper {
  static Future<bool> retrieveShowTutorialValueForSocialMedia(
      SocialMedia socialMedia) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_getShowTutorialKey(socialMedia)) ??
        true; // Default value is true
  }

  static Future<void> setShowTutorialValueForSocialMedia(
      SocialMedia socialMedia, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_getShowTutorialKey(socialMedia), value);
  }

  static String _getShowTutorialKey(SocialMedia socialMedia) {
    switch (socialMedia) {
      case SocialMedia.facebook:
        return 'show_tutorial_facebook';
      case SocialMedia.instagram:
        return 'show_tutorial_instagram';
      case SocialMedia.twitter:
        return 'show_tutorial_twitter';
      case SocialMedia.vimeo:
        return 'show_tutorial_vimeo';
      case SocialMedia.tiktok:
        return 'show_tutorial_tiktok';
      case SocialMedia.whatsapp:
        return 'show_tutorial_whatsapp';
    }
  }
}
