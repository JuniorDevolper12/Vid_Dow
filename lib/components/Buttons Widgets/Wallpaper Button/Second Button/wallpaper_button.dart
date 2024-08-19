import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperButton extends StatelessWidget {
  final String title;
  final String imageAsset;
  final VoidCallback onTap;

  const WallpaperButton(
      {super.key,
      required this.title,
      required this.imageAsset,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Precache the image here
    precacheImage(AssetImage(imageAsset), context);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.26,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'OpenSauceOne'),
            ),
          ),
        ),
      ),
    );
  }
}
