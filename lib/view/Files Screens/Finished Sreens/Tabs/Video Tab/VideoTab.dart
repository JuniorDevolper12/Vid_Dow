import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Image%20WIdgets/Thumbnail%20Image/ThumbnailImage.dart';

import '../../../../../Provider/Download Providers/Downloaded Vidoes/GetDownloads.dart';
import '../../../../../components/Finished Widgets/Vidoes Widgets/VideoWidget.dart';
import '../../../../../components/Progress Widget/RoundProgress/RoundProgress.dart';
import '../../../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../../../utils/App Helpers/Popup Helper/PopupHelper.dart';
import '../../../../../utils/App Helpers/Thumnails Helper/getThumbnails.dart';
import '../../../../Whatsapp Status Screens/Saved Status/Saved Vidoes/saved_video_status.dart';

class Videotab extends StatefulWidget {
  const Videotab({super.key});

  @override
  State<Videotab> createState() => _VideotabState();
}

class _VideotabState extends State<Videotab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetDownloads>(context, listen: false).fetchAndAddVideos();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<GetDownloads>(context, listen: false).fetchAndAddVideos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDownloads>(
      builder: (BuildContext context, GetDownloads value, Widget? child) {
        final videos = value.videos;
        if (videos.isEmpty) {
          return const Center(
              child: Text(
            'No Vidoes',
            style: TextStyle(
                fontFamily: "OpenSauceOne",
                fontWeight: FontWeight.w200,
                color: Colors.grey),
          ));
        }
        return Padding(
          padding: EdgeInsets.only(top: Get.height * 0.002),
          child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return FutureBuilder(
                future: getThumbnails(video.path),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: const EdgeInsets.all(30),
                      child: RoundProgress(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MediaWidget(
                        onchanged: (value) async {
                          Popuphelper.PopupFunctions(
                              value!, context, video.path, video.name);
                        },
                        isaudio: false,
                        Filename: video.name,
                        widget: ThumbnailWidget(snapshot.data!),
                        ontap: () {
                          Navhelper.GoWithoutNavbar(
                              context,
                              SavedStatusVideoViewScreen(
                                videoPath: video.path,
                              ));
                        },
                        Filesize: video.path),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
