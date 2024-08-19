import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Ad%20Widgets/Native%20Ads/Splash%20Native/SplashNative.dart';
import 'package:video_downloader/components/Gradient%20Widget/Main%20Gradient/Gradient%20Wigdet.dart';

import '../../Provider/ShowButton/ShowButton.dart';
import '../../components/App Widgets/App Logo/AppLogo.dart';
import '../../components/Buttons Widgets/Get Started Button/GetStarted.dart';
import '../../utils/Ad Manager/Ad Helper/Adhelper.dart';
import '../../utils/App Helpers/Splash Helper/splash_service.dart';

class Landing_Screen extends StatefulWidget {
  const Landing_Screen({super.key});

  @override
  State<Landing_Screen> createState() => _Landing_ScreenState();
}

class _Landing_ScreenState extends State<Landing_Screen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Showbutton>(context, listen: false).StartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GradientColor(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppLogo(context),
              const Splashnative(),
              Custombutton(
                buttontitle: 'Get Started',
                ontap: () {
                  AdUtils.handleAdAndNavigation(
                    context,
                    (p0) {
                      GotoHome.GotoHomeorLanguage(context);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
