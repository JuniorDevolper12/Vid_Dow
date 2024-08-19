import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../components/App Widgets/Custom App Bars/CustomAppbarWidget.dart';
import '../../../components/Buttons Widgets/Social Help Button/SocialHelpButton.dart';
import '../../../components/Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';
import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../../components/Image WIdgets/How To Download Image/Centreimage.dart';
import '../../../utils/App Utils/Social Media Enum/Socialmediaenum.dart';
import '../Tutorial Screens/TutorialScreen.dart';

class HowtoDownloadScreen extends StatefulWidget {
  const HowtoDownloadScreen({super.key});

  @override
  State<HowtoDownloadScreen> createState() => _HowtoDownloadScreenState();
}

class _HowtoDownloadScreenState extends State<HowtoDownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GradientColor(
          child: Column(
            children: [
              Gap(Get.height * .03),
              CustomAppBarWigdet(
                title: 'Help'.tr,
              ),
              Center(
                child: Column(
                  children: [
                    const Centreimage(),
                    Padding(
                      padding: EdgeInsets.only(bottom: Get.width * 0.05),
                      child: Center(
                        child: CustomText(text: 'How to Download ?'.tr),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.049),
                            child: SoicalHelpButton(
                              ontap: () {
                                Get.to(() => const TutorialScreen(
                                      socialMedia: SocialMedia.facebook,
                                    ));
                              },
                              imagepath: 'images/fbicon.png',
                              title: 'Facebook'.tr,
                            )),
                        SoicalHelpButton(
                            imagepath: 'images/instagram.png',
                            title: 'Instagram'.tr,
                            ontap: () {
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.instagram,
                                  ));
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.049),
                          child: SoicalHelpButton(
                            ontap: () {
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.twitter,
                                  ));
                            },
                            imagepath: 'images/twitter.png',
                            title: 'Twitter / X'.tr,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: Get.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.049),
                            child: SoicalHelpButton(
                              ontap: () {
                                Get.to(() => const TutorialScreen(
                                      socialMedia: SocialMedia.tiktok,
                                    ));
                              },
                              imagepath: 'images/tiktok.png',
                              title: 'TikTok'.tr,
                            )),
                        SoicalHelpButton(
                            imagepath: 'images/whatsapp.PNG',
                            title: 'Whatsapp'.tr,
                            ontap: () {
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.whatsapp,
                                  ));
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.049),
                          child: SoicalHelpButton(
                            ontap: () {
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.vimeo,
                                  ));
                            },
                            imagepath: 'images/vimeo.png',
                            title: 'Vimeo'.tr,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
