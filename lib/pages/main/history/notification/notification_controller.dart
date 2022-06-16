import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  /// #Doniyor
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int indexPage = 0;

  void changeIndex(int index) {
    indexPage = index;
    pageController.animateToPage(
        indexPage, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    update();
  }
}