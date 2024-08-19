import 'package:flutter/material.dart';

class VideoDownloaderButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String mainText;
  final String bottomText;
  final Color bgColor;
  final Color imgColor;
  final Image logoImg;

   const VideoDownloaderButton({
    super.key, 
    this.onTap,
    required this.mainText,
    required this.bottomText,
    required this.bgColor,
    required this.imgColor,
    required this.logoImg,

    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: bgColor // Color(0xffFFF0D9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: imgColor , // Color(0xffFF9900),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                height: 30,
                  child: logoImg), //Icon(Icons.arrow_downward, color: Colors.white),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mainText,
                      
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      bottomText,
                      //'Download Story, Post & Video',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xffFF9900)),
            ],
          ),
        ),
      ),
    );
  }
}
