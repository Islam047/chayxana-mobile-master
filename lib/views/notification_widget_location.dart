
import 'package:cached_network_image/cached_network_image.dart';

import 'package:chayxana/pages/main/history/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../models/item.dart';
import '../services/constants/app_assets.dart';
import '../services/constants/app_colors.dart';
import '../services/constants/app_fonts.dart';

class NotificationLocationWidget extends StatelessWidget {
  Item item;
  Function function;
  final NotificationController controller = Get.find<NotificationController>();
  NotificationLocationWidget({Key? key, required this.item, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Picture of NotificatiRon and buttons
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
                    const Center(child: CircularProgressIndicator()),
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
                      InkWell(
                        onTap: controller.openHomePage,
                        child: CircleAvatar(
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
                      ),
                      // #iconFavorite
                      CircleAvatar(
                          radius: 24,
                          backgroundColor:
                          const Color(0xFF000000).withOpacity(0.24),
                          child: IconButton(
                            onPressed: (){
                              function();
                            }, icon: item.selectLike ? const Icon(Icons.favorite,color: Colors.red,size: 30,) : const Icon(Icons.favorite_outline, size: 30,color: AppColors.activeColor,),

                          )
                      ),
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