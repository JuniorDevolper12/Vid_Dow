import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// Function to navigate to a new screen WITH the navbar
class Navhelper {
  static void GoWithNavbar(BuildContext context, Widget screen) {
    pushScreen(context,
        screen: screen,
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.slideRight);
  }

// Function to navigate to a new screen WITHOUT the navbar
  static void GoWithoutNavbar(BuildContext context, Widget screen) {
    pushScreen(
      context,
      screen: screen,
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.slideRight,
    );
  }
}
