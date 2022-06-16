import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  //#otabek
  double hight = Get.height / 3.toDouble();
  double widthofContainer = Get.width;
  double border = 0;
  bool needStack = true;
  double marginOfContainer1 = 0;
  double marginOfContainer2 = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        animationOfContainer2();
      }
      if (scrollController.position.pixels > 50) {
        animationOfContainer();
      }
    });
  }

  void animationOfContainer2() {
    hight = Get.height / 3.toDouble();
    widthofContainer = Get.width;
    border = 0;
    needStack = true;
    marginOfContainer1 = 0;
    marginOfContainer2 = 0;
    update();

  }

  void animationOfContainer() {
    hight = 60;
    widthofContainer = 60;
    border = 80;
    needStack = false;
    marginOfContainer1 = 30;
    marginOfContainer2 =  30;
    update();

  }
}
