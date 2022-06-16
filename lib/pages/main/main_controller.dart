import 'package:chayxana/services/const_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends SuperController implements GetxController {
  PageController pageController = PageController();
  final List<String> menus = [AppAssets.homeIC, AppAssets.historyIC, AppAssets.personIC];

  int currentPage = 0;

  String selectedMenu = '';

  @override
  void onInit() {
    selectedMenu = menus.first;

    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  void openPage(String menu) {
    selectedMenu = menu;
    var index = menus.indexOf(menu);
    Get.log(index.toString());
    currentPage = index;
    pageController.jumpToPage(index);
    update();
  }

  void onPageChange(int index) {
    selectedMenu = menus[index];
    currentPage = index;
    Get.log(currentPage.toString());
    pageController.jumpToPage(index);
    update();
  }
}