import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Custom%20Text%20Widgets/Custom%20Text%20Widget/CustomTextWidget.dart';

import '../../../../Provider/Download Providers/Downloaded Vidoes/GetDownloads.dart';
import '../../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../../Dashboard Screen/dashboard_screen.dart';
import '../Tabs/Audio Tab/Audio Tab.dart';
import '../Tabs/Video Tab/VideoTab.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  // final OnAudioQuery audioQuery = OnAudioQuery();
  // List<SongModel> Songs = [];

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   Provider.of<GetDownloads>(context, listen: false).fetchAndAddVideos();
  //   getsongs();
  // }

  // void getsongs() async {
  //   Songs = await audioQuery.querySongs();
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetDownloads>(context, listen: false).fetchAndAddVideos();
    Provider.of<GetDownloads>(context, listen: false).fetchAndAddAudios();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.off(const DashboardScreen());
      },
      child: DefaultTabController(
        length: 2,
        child: GradientColor(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: CustomText(text: 'Downloads'),
                  automaticallyImplyLeading: false,
                  leadingWidth: 25,
                  leading: IconButton(
                      onPressed: () {
                        Get.offAll(DashboardScreen());
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20,
                      )),
                  bottom: TabBar(onTap: (value) {}, tabs: [
                    CustomText(text: 'Videos'.tr),
                    CustomText(text: 'Audios'.tr),
                  ]),
                ),
                body: const TabBarView(children: [Videotab(), Audiotab()]))),
      ),
    ); //
  }
}
