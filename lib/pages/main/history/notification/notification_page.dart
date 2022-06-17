import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            toolbarHeight: Get.height / 8.96,
            backgroundColor: AppColors.activeColor,
            elevation: 0.0,
            centerTitle: true,
            // #NavigatorBack
            leading:  CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.colorsTransparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: SvgPicture.asset(
                    AppAssets.arrowBackIC,
                    fit: BoxFit.cover,
                    color: AppColors.iconofService,
                    height: 22.91,
                    width: 14,
                  )),
            ),

            // #NavigationTitleAppBar
            title: Container(
              height: 40,
              width: 218,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.btnColor,
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
                        child: Text("news".tr,
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

                      // #СообщенииPage -> Title1
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.starColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "vastok".tr,
                          style: AppFonts.poppinsBlackSemiBold(
                            fontSize: 18,
                            color: AppColors.activeColor,
                          ),
                        ),
                      ),
                      // #СообщенииPage -> Title2
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
                        child: Text(
                          "waiting tomorrow".tr,
                          style: AppFonts.poppinsBlackMedium(
                            fontSize: 16,
                            color: AppColors.unSelectedTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }
  /*PageBody*/



  Container istoryItmesOfWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Picture of Notification and buttons
          Stack(
            children: [
              SizedBox(
                height: 215,
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
                ),
              ),

              // #icons -> location && favorite
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 22, right: 25, bottom: 15, left: 19),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // #iconLocation
                      CircleAvatar(
                        radius: 24,
                        backgroundColor:
                        const Color(0xFF000000).withOpacity(0.24),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: SvgPicture.asset(
                              AppAssets.locationOutlineIC,
                              fit: BoxFit.cover,
                              color: AppColors.activeColor,
                              height: 30.54,
                              width: 19,
                            )),
                      ),
                      // #iconFavorite
                      CircleAvatar(
                          radius: 24,
                          backgroundColor:
                          const Color(0xFF000000).withOpacity(0.24),
                          child: SvgPicture.asset(
                            AppAssets.favoriteIC,
                            fit: BoxFit.cover,
                            color: AppColors.activeColor,
                            height: 30.54,
                            width: 19,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Chayxana Name and rate
          Container(
            height: 40,
            padding: const EdgeInsets.only(left: 15, top: 6),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.colorsName,
            ),
            child: Text("vastok".tr,
                style: AppFonts.poppinsBlackSemiBold(
                  fontSize: 18,
                  color: AppColors.unSelectedTextColor,
                )),
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("tashkent".tr,
                    style: AppFonts.poppinsBlackSemiBold(
                      fontSize: 16,
                      color: AppColors.unSelectedTextColor,
                    )),
                SizedBox(
                  height: Get.height / 89,
                ),
                Text("yunusabad".tr,
                    style: AppFonts.poppinsBlackMedium(
                      fontSize: 16,
                      color: AppColors.unSelectedTextColor,
                    )),
                SizedBox(
                  height: Get.height / 59,
                ),
                Text("working mode".tr,
                    style: AppFonts.poppinsBlackSemiBold(
                      fontSize: 16,
                      color: AppColors.unSelectedTextColor,
                    )),
                SizedBox(
                  height: Get.height / 89,
                ),
                Text("today".tr,
                    style: AppFonts.poppinsBlackMedium(
                      fontSize: 16,
                      color: AppColors.unSelectedTextColor,
                    )),
                SizedBox(
                  height: Get.height / 89,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}