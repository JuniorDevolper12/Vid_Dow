import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/WebView%20Provider/WebviewProvider.dart';
import 'package:video_downloader/components/Custom%20Text%20Widgets/Custom%20Text%20Widget/CustomTextWidget.dart';

import '../../Provider/Download Providers/Download Provider/Downloadprovider.dart';
import '../../components/Ad Widgets/Banner Ads/Adbannerwidget.dart';
import '../../components/Buttons Widgets/Text Buttons/TextButtonsWidget.dart';
import '../../components/Custom Text Widgets/Heading Text WIdget/HeadingText.dart';
import '../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../components/Search Bar/Search Engine Widget/SearchEngineWidget.dart';
import '../../components/Toggle Swicthes/ToggleSwitches.dart';
import '../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../utils/Methods/Navigation Methods/NavigationMethods.dart';
import '../Dashboard Screen/dashboard_screen.dart';
import '../Langauge Screens/LangaugeScreen.dart';
import '../Tutorials Screens/How To Download/How_to_download_Screen.dart';

class SettingScreen extends StatefulWidget {
  String sellang = 'default'.tr;

  SettingScreen({super.key, this.sellang = 'default'});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedlanguage = '';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<VideoDownloadProvider>(context, listen: false).getsavedata();
  }

  @override
  void initState() {
    super.initState();
    selectedlanguage = widget.sellang;
    Provider.of<VideoDownloadProvider>(context, listen: false).getsavedata();
  }

  @override
  Widget build(BuildContext context) {
    final saveprovider =
        Provider.of<VideoDownloadProvider>(context, listen: true);
    final Web = Provider.of<WebViewProvider>(context, listen: false);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        ChangeScreen().OffAll(DashboardScreen());
      },
      child: GradientColor(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 25,
            title: const CustomText(
              text: 'Settings',
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Gap(Get.height * 0.003),
                const Center(
                  child: AdbannerWidget(),
                ), // Ad banner Will be shown Here
                Column(children: [
                  HeadingText(
                    Heading: 'Download'.tr,
                  ),
                  ToggleSwitchWidget(
                    onToggle: (v) {
                      saveprovider.updateSavedData(v);
                      saveprovider.getsavedata();
                    },
                    status: saveprovider.savedata,
                    titletext: 'Data Saving Mode'.tr,
                    subtitletext: 'Download with Wi-Fi only when turned on'.tr,
                  ),
                  const Divider(),
                  HeadingText(
                    Heading: 'Browser'.tr,
                  ),
                  const SearchEngineWidget(),
                  const Divider(),
                  HeadingText(
                    Heading: 'General Settings'.tr,
                  ),
                  TextButtonsWidget(
                    ButtonText: 'Language Options'.tr,
                    ontap: () async {
                      Navhelper.GoWithoutNavbar(context,
                          const LanguageSelection(Issetttingpage: true));
                    },
                  ),
                  const Divider(),
                  TextButtonsWidget(
                    ButtonText: 'Clear Cache'.tr,
                    ontap: () async {
                      Web.clearCache();
                    },
                  ),
                  const Divider(),
                  const HeadingText(Heading: 'Help'),
                  TextButtonsWidget(
                      ButtonText: 'How to Download'.tr,
                      ontap: () {
                        Get.to(const HowtoDownloadScreen());
                      }),
                  const Divider(),
                  TextButtonsWidget(
                      ButtonText: 'Rate Us'.tr,
                      ontap: () {
                        Get.to(const HowtoDownloadScreen());
                      }),
                  const Divider(),
                  TextButtonsWidget(ButtonText: 'Feedback'.tr, ontap: () {}),
                  const Divider(),
                  TextButtonsWidget(
                      ButtonText: 'Privacy Policy'.tr, ontap: () {})
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
