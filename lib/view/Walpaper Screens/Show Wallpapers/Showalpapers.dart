import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Ad%20Widgets/Banner%20Ads/BannerAd/BannerAd.dart';
import 'package:video_downloader/utils/Methods/Navigation%20Methods/NavigationMethods.dart';
import 'package:video_downloader/view/Walpaper%20Screens/Main%20Screen/Wallpaper_download_screen.dart';

import '../../../Provider/Walpaper Provider/WalpaperProvider.dart';
import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../../components/Progress Widget/RoundProgress/RoundProgress.dart';
import '../View Walppaer/ViewWalpapers.dart'; // Assuming this is your FullscreenImage widget

class Showwalpaperscreen extends StatefulWidget {
  final String searchQuery;
  final String appbartitle;

  const Showwalpaperscreen(
      {super.key, required this.searchQuery, required this.appbartitle});

  @override
  State<Showwalpaperscreen> createState() => _ShowwalpaperscreenState();
}

class _ShowwalpaperscreenState extends State<Showwalpaperscreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PhotosProvider>(context, listen: false)
        .fetchPhotos(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final photosProvider = Provider.of<PhotosProvider>(context);
    final photos = photosProvider.photos;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        ChangeScreen().offthis(const WallpaperDownloaderScreen());
      },
      child: GradientColor(
        child: Scaffold(
            appBar: AppBar(
              leadingWidth: 25,
              titleTextStyle: const TextStyle(
                  fontFamily: 'OpenSauceone',
                  color: Colors.black,
                  fontSize: 14),
              backgroundColor: Colors.transparent,
              title: Text('${widget.searchQuery.tr} ${'Wallpapers'.tr}'),
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                photos.isEmpty
                    ? RoundProgress()
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          final photo = photos[index];
                          final imageUrl =
                              photo['src']['portrait']; // Correct path
                          return InkWell(
                              onTap: () {
                                Get.to(() =>
                                    ViewFullScreenWalpaper(imageUrl: imageUrl));
                              }, // Add tap functionality as needed
                              child: CachedNetworkImage(
                                placeholderFadeInDuration:
                                    const Duration(milliseconds: 100),
                                useOldImageOnUrlChange: false,
                                imageUrl: imageUrl,
                                fit: BoxFit.fill,
                                progressIndicatorBuilder:
                                    (context, url, progress) {
                                  return Lottie.asset(
                                    height: 30,
                                    width: 30,
                                    'images/Search.json',
                                    fit: BoxFit.fill,
                                  );
                                },
                              ));
                        },
                      ),
                Container(
                    margin: EdgeInsets.only(top: Get.height * 0.82),
                    child: const BannerAd3())
              ],
            )),
      ),
    );
  }
}
