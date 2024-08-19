// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
//
// import '../../../components/Buttons Widgets/Social Media Button/social_button.dart';
// import '../../../components/Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';
// import '../../../components/Download Widgets/Direct Link/direct_link.dart';
// import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
// import '../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
// import '../../../utils/App Helpers/Tutorial Helper/tutorialhelper.dart';
// import '../../../utils/App Utils/App Colors/Appcolors.dart';
// import '../../../utils/App Utils/Social Media Enum/Socialmediaenum.dart';
// import '../../Tutorials Screens/Tutorial Screens/TutorialScreen.dart';
// import '../Social Media Download Screen/SocialMediaDownload_Screen.dart';
//
// class VideoDownloaderScreen extends StatefulWidget {
//   const VideoDownloaderScreen({super.key});
//
//   @override
//   State<VideoDownloaderScreen> createState() => _VideoDownloaderScreenState();
// }
//
// class _VideoDownloaderScreenState extends State<VideoDownloaderScreen> {
//   late Map<SocialMedia, bool> showValues = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveShowValues();
//   }
//
//   Future<void> _retrieveShowValues() async {
//     final values = await VideoDownloaderLogic.retrieveShowValues();
//     setState(() {
//       showValues = values;
//     });
//   }
//
//   final TextEditingController directController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: GradientColor(
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             leadingWidth: Get.width * 0.06,
//             backgroundColor: Colors.transparent,
//             title: const CustomText(
//               text: 'Video Downloader',
//             ),
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 8),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   size: 15,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   margin:
//                       const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 20.0,
//                     horizontal: 10.0,
//                   ),
//                   decoration: BoxDecoration(
//                     color: vsColor,
//                     borderRadius: BorderRadius.circular(20.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10.0),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Social Sites Downloader'.tr,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           SocialButton(
//                             image: 'images/facebook.png',
//                             label: 'Facebook'.tr,
//                             onTap: () {
//                               if (showValues[SocialMedia.facebook] ?? false) {
//                                 _updateShowValue(SocialMedia.facebook);
//                                 Get.to(() => const TutorialScreen(
//                                       socialMedia: SocialMedia.facebook,
//                                     ));
//                               } else {
//                                 Navhelper.GoWithNavbar(
//                                     context,
//                                     const SocialMediaDownloadScreen(
//                                         appbartitle: 'Facebook'));
//                               }
//                             },
//                           ),
//                           SocialButton(
//                             image: 'images/instagram.png',
//                             label: 'Instagram'.tr,
//                             onTap: () {
//                               if (showValues[SocialMedia.instagram] ?? false) {
//                                 _updateShowValue(SocialMedia.instagram);
//                                 Get.to(() => const TutorialScreen(
//                                       socialMedia: SocialMedia.instagram,
//                                     ));
//                               } else {
//                                 Navhelper.GoWithNavbar(
//                                     context,
//                                     const SocialMediaDownloadScreen(
//                                         appbartitle: 'Instagram'));
//                               }
//                             },
//                           ),
//                           SocialButton(
//                             image: 'images/twitter.png',
//                             label: 'Twitter / X'.tr,
//                             onTap: () {
//                               if (showValues[SocialMedia.twitter] ?? false) {
//                                 _updateShowValue(SocialMedia.twitter);
//                                 Get.to(() => const TutorialScreen(
//                                       socialMedia: SocialMedia.twitter,
//                                     ));
//                               } else {
//                                 Navhelper.GoWithNavbar(
//                                     context,
//                                     const SocialMediaDownloadScreen(
//                                         appbartitle: 'Twitter / X'));
//                               }
//                             },
//                           ),
//                           SocialButton(
//                             image: 'images/tiktok.png',
//                             label: 'TikTok'.tr,
//                             onTap: () {
//                               if (showValues[SocialMedia.tiktok] ?? false) {
//                                 _updateShowValue(SocialMedia.tiktok);
//                                 Get.to(() => const TutorialScreen(
//                                       socialMedia: SocialMedia.tiktok,
//                                     ));
//                               } else {
//                                 Navhelper.GoWithNavbar(
//                                     context,
//                                     const SocialMediaDownloadScreen(
//                                         appbartitle: 'Tiktok'));
//                               }
//                             },
//                           ),
//                           SocialButton(
//                             image: 'images/vimeo.png',
//                             label: 'Vimeo'.tr,
//                             onTap: () {
//                               if (showValues[SocialMedia.vimeo] ?? false) {
//                                 _updateShowValue(SocialMedia.vimeo);
//                                 Get.to(() => const TutorialScreen(
//                                       socialMedia: SocialMedia.vimeo,
//                                     ));
//                               } else {
//                                 Navhelper.GoWithNavbar(
//                                     context,
//                                     const SocialMediaDownloadScreen(
//                                         appbartitle: 'Vimeo'));
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 20.0,
//                     horizontal: 10.0,
//                   ),
//                   decoration: BoxDecoration(
//                     color: vsColor,
//                     borderRadius: BorderRadius.circular(20.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 5.0),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Direct Link Downloader'.tr,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           DirectLinkDownloader(
//                             controller: directController,
//                             onTap: () {
//                               if (directController.text.isNotEmpty) {
//                                 // Navhelper.GoWithNavbar(context,
//                                 //     WebviewScreen(web: directController.text));
//                               } else {
//                                 Fluttertoast.showToast(msg: 'Empty Url');
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _updateShowValue(SocialMedia socialMedia) async {
//     setState(() {
//       showValues[socialMedia] = false;
//     });
//     await VideoDownloaderLogic.updateShowValue(false, socialMedia);
//   }
// }
