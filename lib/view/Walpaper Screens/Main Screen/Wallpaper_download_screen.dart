import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Walpaper%20Provider/WalpaperProvider.dart';
import 'package:video_downloader/components/Ad%20Widgets/Native%20Ads/Home%20Native/HomeNative.dart';
import 'package:video_downloader/components/Buttons%20Widgets/Search%20Button/SearchButton.dart';
import 'package:video_downloader/components/Buttons%20Widgets/Wallpaper%20Button/Second%20Button/wallpaper_button.dart';
import 'package:video_downloader/components/Custom%20Text%20Widgets/Custom%20Text%20Widget/CustomTextWidget.dart';
import 'package:video_downloader/components/Gradient%20Widget/Main%20Gradient/Gradient%20Wigdet.dart';
import 'package:video_downloader/components/Search%20Bar/Wallpaper%20Search%20Bar/WallPaperSearchBar.dart';
import 'package:video_downloader/view/Dashboard%20Screen/dashboard_screen.dart';

import '../../../Provider/Ads Providers/Native Ad Provider/Native Ad Provider.dart';
import '../Show Wallpapers/Showalpapers.dart';

class WallpaperDownloaderScreen extends StatefulWidget {
  const WallpaperDownloaderScreen({super.key});

  @override
  State<WallpaperDownloaderScreen> createState() =>
      _WallpaperDownloaderScreenState();
}

class _WallpaperDownloaderScreenState extends State<WallpaperDownloaderScreen> {
  final List<Map<String, dynamic>> gridItems = [
    {
      'type': 'category',
      'title': 'Flowers',
      'image': 'images/wallpaper_pic.png'
    },
    {'type': 'category', 'title': 'Trending', 'image': 'images/trending.jpg'},
    {'type': 'ad'},
    {'type': 'category', 'title': '3D', 'image': 'images/3d.jpg'},
    {'type': 'category', 'title': 'Anime', 'image': 'images/anime.jpg'},
    {'type': 'category', 'title': 'Animals', 'image': 'images/lion.jpg'},
    {'type': 'category', 'title': 'Cars', 'image': 'images/cars.jpg'},
    {'type': 'category', 'title': 'City', 'image': 'images/city.jpg'},
    {'type': 'category', 'title': 'Minimalism', 'image': 'images/mini.jpg'},
    {'type': 'ad'},
    {'type': 'category', 'title': 'Games', 'image': 'images/game.jpg'},
    {'type': 'category', 'title': 'Space', 'image': 'images/space.jpg'},
    {'type': 'category', 'title': 'Landscapes', 'image': 'images/Land.jpg'},
    {'type': 'ad'},
    {'type': 'category', 'title': 'Music', 'image': 'images/Music.jpg'},
    {
      'type': 'category',
      'title': 'Motivational Quotes',
      'image': 'images/quotes.jpg'
    },
    {'type': 'category', 'title': 'Movies', 'image': 'images/Movies.jpg'},
    {'type': 'category', 'title': 'Travel', 'image': 'images/Travel.jpg'},
    {'type': 'ad'},
  ];

  @override
  Widget build(BuildContext context) {
    final wallpaperHelper = Provider.of<PhotosProvider>(context, listen: false);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        wallpaperHelper.turnoffSearch();
        Get.offAll(const DashboardScreen());
      },
      child: GradientColor(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 25,
            title: const CustomText(text: 'Wallpaper Downloader'),
            actions: [SearchButton()],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              WallpaperSearchbar(),
              Expanded(
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    final item = gridItems[index];

                    if (item['type'] == 'ad') {
                      return Consumer<SplashNativeloader>(
                          builder: (context, value, child) {
                        if (value.isAdloaded) {
                          return const HomeNativeAd();
                        } else
                          return Container();
                      });
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WallpaperButton(
                        onTap: () {
                          Get.to(() => Showwalpaperscreen(
                                appbartitle: item['title'],
                                searchQuery: item['title'],
                              ));
                        },
                        title: item['title'],
                        imageAsset: item['image'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
