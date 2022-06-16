import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            appBar: AppBar(
              toolbarHeight: Get.height / 8.96,
              backgroundColor: AppColors.activeColor,
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/icons/img_12.png"),
                  color: AppColors.unSelectedTextColor,
                ),
              ),
              title: Container(
                height: Get.height / 20,
                width: Get.width / 1.9,
                decoration: BoxDecoration(
                  color: AppColors.dashboardRowButtonIsNotPressed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height / 26,
                      width: Get.width / 4.5,
                      decoration: BoxDecoration(
                        color: controller.indexPage == 0
                            ? AppColors.activeColor
                            : AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.changeIndex(0);
                        },
                        child: const Center(
                          child: Text(
                            "Новости",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.unSelectedTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 26,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                        color: controller.indexPage == 1
                            ? AppColors.activeColor
                            : AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.changeIndex(1);
                        },
                        child: const Center(
                          child: Text(
                            "Сообщении",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.unSelectedTextColor,
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
                    itemCount: 2,
                    itemBuilder: (BuildContext context, index) {
                      return istoryItmesOfWidget();
                    }),
                ListView.builder(itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xffFCAF45),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Васток",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          height: 60,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.activeColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Ждем вас завтра в 19:00",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          );
        });
  }

  Container istoryItmesOfWidget() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Picture of Notification and buttons
              Stack(
                children: [
                  SizedBox(
                      height: 218,
                      width: double.infinity,

                      ///### Image Url
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.colorBurn)),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 25, right: 25, bottom: 15, left: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0x7400ccff),
                            child: IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage("assets/icons/img_13.png"),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0x7400ccff),
                            child: IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage("assets/icons/img.png"),
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              /// Chayxana Name and rate
              Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                color: const Color(0xffE9E9E9),
                child: const Text(
                  "Васток",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),

              /// chayxana location and rejim
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ташкент",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: Get.height / 89,
                    ),
                    const Text(
                      "Юнусабадский район, Амир Темур",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: Get.height / 59,
                    ),
                    const Text(
                      "Режим роботы",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: Get.height / 89,
                    ),
                    const Text(
                      "Сегодгя 10:00 - 24:00",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: Get.height / 89,
                    ),
                  ],
                ),
              )
            ]));
  }
}
