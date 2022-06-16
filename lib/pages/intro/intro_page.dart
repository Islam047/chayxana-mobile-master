import 'package:chayxana/services/constants/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'intro_controller.dart';

class IntroPage extends StatelessWidget {
  static const String id = "/intro_page";

  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
      init: IntroController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.introBackground,
          body: Stack(
            children: [
              PageView(
                controller: controller.pageController,
                children: [
                  pageViewForm("intro_header_one".tr, "intro_content_one".tr,
                      controller.images[0]),
                  pageViewForm('intro_header_one'.tr, "intro_content_one".tr,
                      controller.images[1]),
                  pageViewForm('intro_header_one'.tr, "intro_content_one".tr,
                      controller.images[2]),
                ],
                onPageChanged: (index) {
                  controller.directSmooth(index);
                },
              ),

              ///### smooth indicator and inter button
              Positioned(
                left: Get.width / 5.078,
                top: Get.height / 1.251,
                bottom: Get.height / 20.36,
                child: Column(children: [
                  Row(
                    children: [
                      smoothIndicator(controller, 0),
                      const SizedBox(width: 14),
                      smoothIndicator(controller, 1),
                      const SizedBox(width: 14),
                      smoothIndicator(controller, 2),
                    ],
                  ),
                  SizedBox(height: Get.height / 15),

                  ///### inter button
                  interButton(controller, controller.page)
                ]),
              )
            ],
          ),
        );
      },
    );
  }

  Container interButton(IntroController controller, int pageIndex) {
    return Container(
      width: Get.width / 1.6,
      height: Get.height / 16,
      decoration: BoxDecoration(
          color: AppColors.activeColor,
          borderRadius: BorderRadius.circular(12)),
      child: MaterialButton(
        onPressed: () {
          controller.bottomTapped(controller.page);
        },
        child: Center(
          child: Text(
            controller.page == 2 ? "button_enter".tr : "button_next".tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.unSelectedTextColor),
          ),
        ),
      ),
    );
  }

  CircleAvatar smoothIndicator(IntroController controller, index) {
    return CircleAvatar(
      backgroundColor: controller.page == index
          ? AppColors.unSelectedTextColor
          : AppColors.activeColor,
      radius: 7,
    );
  }

  Center pageViewForm(String text1, String text2, String image) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: Get.height / 8.2,
          ),
          Text(
            text1,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.activeColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.height / 9.8),
          Image.asset(
            image,
            width: Get.width / 1.089,
            height: Get.height / 3.143,
          ),
          // OpenSVG(
          //   path: image,

          // ),
          SizedBox(height: Get.height / 8),
          Text(
            text2,
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.activeColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
