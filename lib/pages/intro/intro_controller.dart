import 'package:chayxana/pages/main/main_page.dart';
import 'package:chayxana/services/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  /// #Otabek

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  List<String> images = [
    AppAssets.intro1IM,
    AppAssets.intro2IM,
    AppAssets.intro3IM
  ];

  int page = 0;

  void directSmooth(int index) {
    page = index;
    update();
  }

  void goHome() => Get.off(() => const MainPage());

  void bottomTapped(int index) {
    page = index;
    update();
    if (index == 2) {
      goHome();
    } else {
      pageController.animateToPage(index + 1,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
