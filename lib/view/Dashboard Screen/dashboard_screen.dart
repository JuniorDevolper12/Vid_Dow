import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

import '../../Provider/Download Providers/Download Provider/Downloadprovider.dart';
import '../../Provider/WebView Provider/WebviewProvider.dart';
import '../../components/CustomIcons/Customiucon.dart';
import '../../utils/App Helpers/Toast Helper/ToastHelper.dart';
import '../../utils/App Utils/App Colors/Appcolors.dart';
import '../Exit Screen/exit.dart';
import '../Files Screens/Finished Sreens/Downloads/Downloads_Screen.dart';
import '../Files Screens/Progress Screen/progress_screen.dart';
import '../Home Screens/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoDownloadProvider>(context, listen: false).getsavedata();
    Provider.of<WebViewProvider>(context, listen: false).getengine();
  }

  DateTime btime = DateTime.now();
  final _controller = PersistentTabController(initialIndex: 0);
  final TextStyle style =
      const TextStyle(fontFamily: 'OpenSauceOne', fontSize: 12);

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            textStyle: style,
            activeForegroundColor: appColor,
            icon: const CustomIcons(
              icon: 'images/tabImg.png',
            ),
            title: "Tab".tr,
          ),
        ),
        PersistentTabConfig(
          screen: const Progress_Screen(),
          item: ItemConfig(
            textStyle: style,
            activeForegroundColor: appColor,
            icon: const CustomIcons(
              icon: 'images/Progressicon.png',
            ),
            title: "Progress".tr,
          ),
        ),
        PersistentTabConfig(
          screen: const DownloadsScreen(),
          item: ItemConfig(
            textStyle: style,
            activeForegroundColor: appColor,
            icon: const CustomIcons(
              icon: 'images/Fileicon.png',
            ),
            title: "Downloads".tr,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          final currentTime = DateTime.now();
          if (currentTime.difference(btime) > const Duration(seconds: 3)) {
            Toasthelper.Showtoast('Tap again To Exit');
            btime = currentTime;
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const ExitScreen())));
          }
        },
        child: PersistentTabView(
          screenTransitionAnimation: const ScreenTransitionAnimation(
              duration: Duration(milliseconds: 500), curve: Curves.ease),
          stateManagement: false,
          controller: _controller,
          tabs: _tabs(),
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: const NavBarDecoration(
              color: Colors.white54,
            ),
          ),
        ),
      );
}
