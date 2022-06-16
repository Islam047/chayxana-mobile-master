import 'package:chayxana/pages/main/profile/profile_page.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'history/history_page.dart';
import 'home/home_page.dart';
import 'main_controller.dart';

class MainPage extends StatelessWidget {
  static const String id = '/main_page';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [HomePage(), HistoryPage(), ProfilePage()],
                onPageChanged: (index) => controller.onPageChange(index),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.15, vertical: Get.height * .03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: AppColors.activeColor,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.25),
                          blurRadius: 4.0,
                          offset: const Offset(0, 4)),
                    ],
                  ),
                  height: 70,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.menus
                        .map((menu) => bottomButton(menu, controller))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget bottomButton(String name, MainController controller) {
    return MaterialButton(
      disabledColor: AppColors.borderColor,
      minWidth: 50,
      height: 50,
      padding: const EdgeInsets.all(2),
      elevation: 0,
      splashColor: AppColors.activeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: controller.selectedMenu == name
          ? AppColors.mainColor
          : AppColors.activeColor,
      child: OpenSVG(
          path: name,
          width: 26,
          height: 26,
          isGradient: false,
          color: controller.selectedMenu == name
              ? AppColors.activeColor
              : AppColors.borderColor),
      onPressed: () => controller.openPage(name),
    );
  }
}
