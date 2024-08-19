// video_downloader_logic.dart
import '../../App Utils/Social Media Enum/Socialmediaenum.dart';
import '../Social Helper/GetShowbool.dart';

class VideoDownloaderLogic {
  static Future<Map<SocialMedia, bool>> retrieveShowValues() async {
    final Map<SocialMedia, bool> showValues = {};
    for (final socialMedia in SocialMedia.values) {
      final show =
          await SharedPreferencesHelper.retrieveShowTutorialValueForSocialMedia(
              socialMedia);
      showValues[socialMedia] = show;
    }
    return showValues;
  }

  static Future<void> updateShowValue(
      bool value, SocialMedia socialMedia) async {
    await SharedPreferencesHelper.setShowTutorialValueForSocialMedia(
        socialMedia, value);
  }
}
