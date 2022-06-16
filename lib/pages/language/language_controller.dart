import 'package:chayxana/pages/intro/intro_page.dart';
import 'package:chayxana/services/lang_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController controllerLogo;
  late AnimationController controllerList;
  late Animation<double> animationFadeLogo;
  late Animation<double> animationFadeList;
  late Animation<Offset> animationSlide;

  int selected = 0;
  List<String> languages = LangService.items;
  int focusedItem = 0;

  @override
  void onInit() {
    animationFunction();
    super.onInit();
  }

  void openIntroPage() => Get.off(() => const IntroPage());

  void animationFunction() {
    controllerLogo = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    controllerList = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animationFadeLogo =
        CurvedAnimation(parent: controllerLogo, curve: Curves.easeIn);
    animationFadeList =
        CurvedAnimation(parent: controllerList, curve: Curves.easeIn);
    animationSlide = Tween<Offset>(
            begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
        .animate(
            CurvedAnimation(parent: controllerLogo, curve: Curves.elasticIn));
    controllerLogo.forward().whenComplete(() => controllerList.forward());
  }

  void langChangeWithAnimation(int index) {
    selected = index;
    LangService.changeLocale(LangService.langs[selected]);
    update();
  }
}
