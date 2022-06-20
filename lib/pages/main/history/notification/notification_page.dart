
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/views/notification_widget_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../views/notification_message.dart';
import 'notification_controller.dart';

class NotificationPage extends StatelessWidget {
  static const String id = "/notification_page";

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            toolbarHeight: Get.height / 8.96,
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            centerTitle: true,
            // #NavigatorBack
            leading: GestureDetector(
              onTap: () {
                controller.openHistoryPage();
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.colorsTransparent,
                child: SvgPicture.asset(
                  AppAssets.arrowBackIC,
                  fit: BoxFit.cover,
                  color: AppColors.iconofService,
                  height: 22.91,
                  width: 14,
                ),
              ),
            ),

            // #NavigationTitleAppBar
            title: Container(
              height: 40,
              width: 218,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // #Title -> Новости
                  Container(
                    alignment: Alignment.center,
                    height: 34,
                    width: 91,
                    decoration: BoxDecoration(
                      color: controller.indexPage == 0
                          ? AppColors.activeColor
                          : AppColors.colorsTransparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.changeIndex(0);
                      },
                      child: Center(
                        child: Text(
                          "news".tr,
                          textAlign: TextAlign.center,
                          style: AppFonts.poppinsBlackMedium(
                            color: AppColors.unSelectedTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),




                  // #Title -> Сообщении
                  Container(
                    height: 34,
                    width: 118,
                    decoration: BoxDecoration(
                      color: controller.indexPage == 1
                          ? AppColors.activeColor
                          : AppColors.colorsTransparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.changeIndex(1);
                      },
                      child: Center(
                        child: Text(
                          "message".tr,
                          textAlign: TextAlign.center,
                          style: AppFonts.poppinsBlackMedium(
                            color: AppColors.unSelectedTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.changeIndex(index);
            },
            children: [
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.favoriteList.length,
                  itemBuilder: (BuildContext context, index) {
                    return NotificationLocationWidget(
                      function: () {
                        controller.selectedLike(index);
                      },
                      item: controller.favoriteList[index],
                    );
                  }),
              ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return const NotificationMessageWidget();
                  })
            ],
          ),
        );
      },
    );
  }
}