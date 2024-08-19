import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../utils/App Helpers/Toast Helper/ToastHelper.dart';
import '../../../utils/App Helpers/Tutorial Helper/tutorialhelper.dart';
import '../../../utils/App Utils/Social Media Enum/Socialmediaenum.dart';
import '../../../view/Social Media Screens/Social Media Download Screen/SocialMediaDownload_Screen.dart';
import '../../../view/Tutorials Screens/Tutorial Screens/TutorialScreen.dart';
import '../Social Media Button/social_button.dart';

Widget SocialMedias() {
  comingsoon() {
    Toasthelper.Showtoast('Coming soon....');
  }

  late Map<SocialMedia, bool> showValues = {};
  return StatefulBuilder(
    builder: (context, setState) {
      Future<void> retrieveShowValues() async {
        final values = await VideoDownloaderLogic.retrieveShowValues();
        setState(() {
          showValues = values;
        });
      }

      retrieveShowValues();
      Future<void> updateShowValue(SocialMedia socialMedia) async {
        setState(() {
          showValues[socialMedia] = false;
        });
        await VideoDownloaderLogic.updateShowValue(false, socialMedia);
      }

      return SizedBox(
        height: Get.height * 0.078,
        width: Get.width * 0.9,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SocialButton(
                  image: 'images/facebook.png',
                  label: 'Facebook'.tr,
                  onTap: () {
                    if (showValues[SocialMedia.facebook] ?? false) {
                      updateShowValue(SocialMedia.facebook);
                      Get.to(() => const TutorialScreen(
                            socialMedia: SocialMedia.facebook,
                          ));
                    } else {
                      Navhelper.GoWithNavbar(
                          context,
                          const SocialMediaDownloadScreen(
                              appbartitle: 'Facebook'));
                    }
                  },
                ),
                SocialButton(
                  image: 'images/instagram.png',
                  label: 'Instagram'.tr,
                  onTap: () {
                    if (showValues[SocialMedia.instagram] ?? false) {
                      updateShowValue(SocialMedia.instagram);
                      Get.to(() => const TutorialScreen(
                            socialMedia: SocialMedia.instagram,
                          ));
                    } else {
                      Navhelper.GoWithNavbar(
                          context,
                          const SocialMediaDownloadScreen(
                              appbartitle: 'Instagram'));
                    }
                  },
                ),
                SocialButton(
                  image: 'images/twitter.png',
                  label: 'Twitter / X'.tr,
                  onTap: () {
                    if (showValues[SocialMedia.twitter] ?? false) {
                      updateShowValue(SocialMedia.twitter);
                      comingsoon();
                    } else {
                      comingsoon();
                    }
                  },
                ),
                SocialButton(
                  image: 'images/tiktok.png',
                  label: 'Tiktok'.tr,
                  onTap: () {
                    if (showValues[SocialMedia.tiktok] ?? false) {
                      updateShowValue(SocialMedia.tiktok);
                      Get.to(() => const TutorialScreen(
                            socialMedia: SocialMedia.tiktok,
                          ));
                    } else {
                      Navhelper.GoWithNavbar(
                          context,
                          const SocialMediaDownloadScreen(
                              appbartitle: 'Tiktok'));
                    }
                  },
                ),
                SocialButton(
                  image: 'images/vimeo.png',
                  label: 'Vimeo'.tr,
                  onTap: () {
                    if (showValues[SocialMedia.vimeo] ?? false) {
                      updateShowValue(SocialMedia.vimeo);
                      comingsoon();
                    } else {
                      comingsoon();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
