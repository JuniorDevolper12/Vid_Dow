import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../components/Buttons Widgets/Square Button/Buttonswidget.dart';
import '../../../utils/App Utils/Social Media Enum/Socialmediaenum.dart';
import '../../Social Media Screens/Social Media Download Screen/SocialMediaDownload_Screen.dart';

class TutorialScreen extends StatefulWidget {
  final SocialMedia socialMedia;

  const TutorialScreen({super.key, required this.socialMedia});

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final Map<SocialMedia, List<String>> imagePaths = {
    SocialMedia.facebook: [
      "images/t2.PNG",
      "images/t8.PNG",
      "images/t11.PNG",
    ],
    SocialMedia.instagram: [
      "images/t9.PNG",
      "images/t5.PNG",
      "images/t12.PNG",
    ],
    SocialMedia.twitter: [
      "images/t19.PNG",
      "images/t15.png",
      "images/t21.PNG",
    ],
    SocialMedia.vimeo: [
      "images/t14.PNG",
      "images/t18.PNG",
      "images/t23.PNG",
    ],
    SocialMedia.tiktok: [
      "images/t13.PNG",
      "images/t15.png",
      "images/t22.PNG",
    ],
    SocialMedia.whatsapp: [
      "images/t4.PNG",
      "images/t6.PNG",
    ],
  };
  int _currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentIndex < imagePaths[widget.socialMedia]!.length - 1) {
        setState(() {
          _currentIndex++;
        });
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _timer.cancel(); // Stop auto-scrolling
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.8,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths[widget.socialMedia]!.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(
                      imagePaths[widget.socialMedia]![index],
                      fit: BoxFit.cover,
                      width: w,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h * 0.007, bottom: h * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imagePaths[widget.socialMedia]!.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: w * 0.02,
                    height: h * 0.01,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? HexColor('A660DB')
                          : HexColor('939598'),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentIndex != imagePaths[widget.socialMedia]!.length - 1)
                  RoundButton(
                    title: 'Next'.tr,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                if (_currentIndex == imagePaths[widget.socialMedia]!.length - 1)
                  RoundButton(
                    title: 'Finish'.tr,
                    ontap: () {
                      setState(() {});
                      if (widget.socialMedia == SocialMedia.facebook) {
                        Get.off(SocialMediaDownloadScreen(
                            appbartitle: 'Facebook'.tr));
                      } else if (widget.socialMedia == SocialMedia.tiktok) {
                        Get.off(SocialMediaDownloadScreen(
                            appbartitle: 'Tiktok'.tr));
                      } else if (widget.socialMedia == SocialMedia.instagram) {
                        Get.off(SocialMediaDownloadScreen(
                            appbartitle: 'Instagram'.tr));
                      } else {
                        Get.back();
                      }
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
