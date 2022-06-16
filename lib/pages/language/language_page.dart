import 'package:chayxana/pages/language/language_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  static const String id = '/lang_page';

  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
          Get.log(controller.focusedItem.toString());

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: AppColors.activeColor,
              title: Text('str_choose_lang'.tr,
                  style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.unSelectedTextColor,
                      fontWeight: FontWeight.w600)),
              actions: [
                IconButton(
                    onPressed: () => controller.openIntroPage(),
                    splashRadius: 25,
                    icon: const Icon(
                      Icons.navigate_next,
                      color: AppColors.iconofService,
                    )),
                SizedBox(
                  width: Get.width * 0.01,
                )
              ],
            ),
            backgroundColor: ThemeService.colorBackGroundWhite,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * .01),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    child: FadeTransition(
                      opacity: controller.animationFadeList,
                      child: SizedBox(
                        height: 165,
                        child: CupertinoPicker(
                          backgroundColor: AppColors.activeColor,
                          selectionOverlay: selectionOverlay(),
                          squeeze: 1,
                          useMagnifier: true,
                          magnification: 1.2,
                          diameterRatio: 10,
                          itemExtent: 60,

                          onSelectedItemChanged: (index) =>
                              controller.langChangeWithAnimation(index),
                          looping: true,
                          // physics: const FixedExtentScrollPhysics(),
                          children: [
                            getLanguage("English", 0, controller.selected),
                            getLanguage("Russian", 1, controller.selected),
                            getLanguage("Uzbek", 2, controller.selected),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Column selectionOverlay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 300,
          height: 2,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: AppColors.selectionOverlayGradient,
          )),
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: AppColors.selectionOverlayGradient,
          )),
          height: 2,
        ),
      ],
    );
  }

  Widget getLanguage(String language, int index, int selected) {
    return ListTile(
      title: InkWell(
        child: Text(language,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 22,
                color: AppColors.unSelectedTextColor,
                fontWeight: FontWeight.w700)),
        onTap: () {},
      ),
    );
  }
}
