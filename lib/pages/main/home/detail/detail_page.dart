import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/pages/main/home/detail/detail_controller.dart';
import 'package:chayxana/services/constants/app_assets.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  static const String id = "/detail_page";

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.activeColor,
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///### Main image of detail Page and animation
                Stack(
                  children: [
                    Row(children: [AnimatedContainer(
                        margin: EdgeInsets.only(
                            left: controller.marginOfContainer1,
                            top: controller.marginOfContainer2),
                        height: controller.hight,
                        width: controller.widthofContainer,
                        duration: const Duration(milliseconds: 100),

                        ///### Image Url
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              controller.border.toDouble()),
                          child: CachedNetworkImage(
                            imageUrl:
                            "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.red, BlendMode.colorBurn)),
                              ),
                            ),
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        )),],),
                    !controller.needStack?const Positioned(

                        top: 40,
                        left: 110,
                        child: Text("Chayxana name",style: TextStyle(fontSize: 26, fontFamily: "Poppons", fontWeight: FontWeight.w600),)):const SizedBox(),
                   ///CHAYXANA NAME ABOVE OF APPBar
                    Positioned(
                      child: controller.needStack
                          ? Container(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 15, bottom: 15),
                              height: Get.height / 3.21,
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                          child: IconButton(
                                            /// X Icon
                                        icon: const Icon(
                                          Icons.clear,
                                          color: AppColors.activeColor,
                                          size: 40,
                                        ),
                                        onPressed: () {},
                                      )),
                                      /// locagon button
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundColor:
                                            const Color(0x7400ccff),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const OpenSVG(path: "assets/icons/ic_favorite.svg",color: AppColors.iconofDetail,),
                                        ),
                                      )
                                    ],
                                  ),
                                  /// Its s for pucture number button
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      /// for border
                                      Container(
                                        height: Get.height / 22.4,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const OpenSVG(path: "assets/icons/ic_camera.svg",)
                                            ),
                                            const Text(
                                              "14",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: AppColors.activeColor),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
          Expanded(child:  ListView(
        controller: controller.scrollController,
                  children: [
                    ///###chayxana name and rate
                    Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: AppColors.dashboardRowButtonIsNotPressed,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "chayxanaName",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: Get.height / 22.4,
                            width: Get.width / 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: AppColors.starColor,
                                ),
                                Text(
                                  "8.2",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: AppColors.unSelectedTextColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    ///### desciription
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(    "location_of_city".tr,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),

                          ),
                          const SizedBox(height: 15),
                           Text(
                            "city".tr,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text("region_locatin".tr,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 15),
                          Container(
                            height: Get.height / 11.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.greyText,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Divider(
                              color: AppColors.unSelectedTextColor, height: 1),
                          const SizedBox(height: 15),
                          Text(
                            "Description".tr,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                           Text(
                               "description_detail".tr,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 15),
                          const Divider(
                              color: AppColors.unSelectedTextColor, height: 1),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "working_mode".tr,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "working_hour".tr,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Container(
                                height: Get.height / 15.44,
                                width: Get.width / 2.5,
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.dashboardRowButtonIsNotPressed,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child:  Text(
                                      'more'.tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppColors.unSelectedTextColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Divider(
                              color: AppColors.unSelectedTextColor, height: 1),
                          const SizedBox(height: 15),
                          const Text(
                            "Information",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              buttonOfServices(
                                  AppAssets.phoneIC, "call".tr),
                              buttonOfServices(
                                  AppAssets.connectObjectIC, "route".tr),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Divider(
                            color: AppColors.unSelectedTextColor,
                            height: 1,
                          ),

                          ///### Buttons of servise
                          Column(
                            children: [
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buttonOfServices(
                                      AppAssets.tableIC, "verandas".tr),
                                  buttonOfServices(
                                      AppAssets.carIC, "parking".tr),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buttonOfServices(
                                      AppAssets.tvIC, "tv".tr),
                                  buttonOfServices(
                                      AppAssets.wifiIC, "wifi".tr),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 200,),
                  ],
                ))
              ],
            ),
        );
      },
    );
  }

  Container buttonOfServices(String imageIcon, String textOfIcon) {
    return Container(
      height: 45,
      width: Get.width / 2.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.dashboardRowButtonIsNotPressed,
      ),
        child: Row(
          children: [
            OpenSVG(path: imageIcon,color: AppColors.iconofService,width: 40,height: 40,),
            SizedBox(
              width: Get.width / 20,
            ),
            Text(
              textOfIcon.tr,
              style: const TextStyle(fontSize: 18,color: AppColors.iconofService),
            ),
          ],
        ),

    );
  }
}