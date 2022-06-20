import 'package:chayxana/pages/main/history/history_page.dart';
import 'package:chayxana/pages/main/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/Item.dart';
import '../../../../services/util_service.dart';

class NotificationController extends GetxController {
  // #listOfLikes
  List<Item>  favoriteList =[
    Item(selectLike: true, ),
    Item(selectLike: false, ),
    Item(selectLike: false, ),
    Item(selectLike: false, ),
    Item(selectLike: true, ),
    Item(selectLike: true, ),
  ];

  // #likes
  void selectedLike(int index){
    favoriteList[index].selectLike = !favoriteList[index].selectLike;
    update();

  }


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

  // back to location(HomePage)
  void openHomePage(){
    Get.to(const HomePage());
    update();
  }

  // back to location(HomePage)
  void openHistoryPage(){
    Get.to(const HistoryPage());
    update();
  }

  bool favotite = false;

  void isFavorite(){
    favotite = !favotite;
    update();
    if(favotite == true){
      Utils.fireSnackGetX('You liked it');
      return;
    }else{
      Utils.fireSnackGetX('You do not liked it');

    }
  }

}