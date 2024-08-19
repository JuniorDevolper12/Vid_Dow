import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Download Providers/Download Provider/Downloadprovider.dart';
import '../../../utils/App Utils/App Colors/Appcolors.dart';
import '../../Buttons Widgets/PopupButtons/PopupButtons.dart';

class ProgressWidget extends StatefulWidget {
  final String thumbnail;
  final String videoname;
  final bool isaudio;
  final double progress;
  final int downloadid;

  const ProgressWidget(
      {super.key,
      required this.thumbnail,
      required this.isaudio,
      required this.videoname,
      required this.progress,
      required this.downloadid});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    final downloadprovider = Provider.of<VideoDownloadProvider>(context);
    DateTime now = DateTime.now();
    int day = now.day;
    int month = now.month;
    int year = now.year;
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.002),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.height * 0.01),
                child: Container(
                  height: Get.height * 0.07,
                  width: Get.width * 0.19,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: widget.thumbnail.isNotEmpty
                          ? Image.network(widget.thumbnail)
                          : const Icon(
                              Icons.video_collection_rounded,
                              color: Colors.blue,
                            )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * .22, top: Get.height * 0.0046),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      downloadprovider.trimToLength(widget.videoname, 30),
                      style: const TextStyle(
                          fontFamily: 'OpenSauceOne', fontSize: 13),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.004),
                      child: Row(
                        children: [
                          const Gap(2),
                          Container(
                            height: 15,
                            width: 18,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                            child: Center(
                              child: Text(
                                '${widget.progress.toStringAsFixed(0)}%',
                                style: const TextStyle(
                                    fontSize: 5, color: Colors.white),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.75,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: Get.height * 0.003),
                              child: Text(
                                widget.isaudio
                                    ? 'Audio |  MP3 |  $year-$month-$day'
                                    : 'Video |  MP4 |  $year-$month-$day',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSauceOne',
                                  fontSize: 8.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: Get.width * .873,
                child: Downloadoptions(
                  onpause: () {},
                  oncancel: () async {
                    final result =
                        await FileDownloader.cancelDownload(widget.downloadid);
                    if (result) {
                      downloadprovider
                          .deleteDownload(widget.downloadid.toString());
                    } else {}

                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: Get.height * 0.062,
                left: Get.width * .23,
                child: SizedBox(
                  height: 4,
                  width: 250,
                  child: LinearProgressIndicator(
                    value: widget.progress / 100,
                    color: appColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
