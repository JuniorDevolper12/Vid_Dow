import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Buttons%20Widgets/Whatsapp%20Button/Whatsapp%20Select%20Button/Whatsapp%20Select%20Button.dart';
import 'package:video_downloader/view/Dashboard%20Screen/dashboard_screen.dart';

import '../../../Provider/Whatsapp Status Providers/Get Status/get_status_provider.dart';
import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../../utils/App Utils/App Colors/Appcolors.dart';
import '../../../utils/Methods/Navigation Methods/NavigationMethods.dart';
import '../Tabs/Images Tab/ImagesTab.dart';
import '../Tabs/Saved Tab/SavedTab.dart';
import '../Tabs/Vidoes Tab/VidoesTab.dart';

class WhatsAppDownloaderScreen extends StatefulWidget {
  final bool isbusiness;

  const WhatsAppDownloaderScreen({super.key, required this.isbusiness});

  @override
  _WhatsAppDownloaderScreenState createState() =>
      _WhatsAppDownloaderScreenState();
}

class _WhatsAppDownloaderScreenState extends State<WhatsAppDownloaderScreen> {
  @override
  Widget build(BuildContext context) {
    final getStatusProvider =
        Provider.of<GetStatusProvider>(context, listen: false);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        ChangeScreen().OffAll(DashboardScreen());
      },
      child: DefaultTabController(
          length: 3,
          child: GradientColor(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Whatsapptitle(widget.isbusiness),
                leadingWidth: 25,
                backgroundColor: Colors.transparent,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Get.height * 0.1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SimpleWhatsappButton(
                            widget.isbusiness,
                            () {
                              setState(() {});
                              getStatusProvider.selectDirectory(false);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WhatsAppDownloaderScreen(
                                            isbusiness: false),
                                  ));
                            },
                          ),
                          WhatsappBusinessButton(
                            widget.isbusiness,
                            () {
                              setState(() {});
                              getStatusProvider.selectDirectory(true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WhatsAppDownloaderScreen(
                                            isbusiness: true),
                                  ));
                            },
                          )
                        ],
                      ),
                      TabBar(
                        tabs: [
                          Tab(text: 'Images'.tr),
                          Tab(text: 'Videos'.tr),
                          Tab(text: 'Saved'.tr),
                        ],
                        indicatorColor: appColor,
                      ),
                    ],
                  ),
                ),
              ),
              body: Stack(children: [
                const TabBarView(
                  children: [
                    ImagesTab(),
                    VidoesTab(),
                    SavedTab(),
                  ],
                ),
                // StatusSceenAd()
              ]),
            ),
          )),
    );
  }
}
