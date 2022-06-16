

import 'package:chayxana/services/const_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  openDialog() {
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        height: Get.height,
        width: Get.height,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 230,
          decoration: BoxDecoration(
            color: AppColors.activeColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Обратная сквязь",
                style: AppFonts.poppinsBlackMedium(
                    fontSize: 20, color: AppColors.unSelectedTextColor),
              ),
              const Divider(
                height: 1,
                color: AppColors.borderColor,
              ),
              Text(
                "Telegram",
                style: AppFonts.poppinsMediumChat(),
              ),
              const Divider(
                height: 1,
                color: AppColors.borderColor,
              ),
              Text(
                "Instagram",
                style: AppFonts.poppinsMediumChat(),
              ),
              const Divider(
                height: 1,
                color: AppColors.borderColor,
              ),
              Text(
                "Facebook",
                style: AppFonts.poppinsMediumChat(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openAndroidDialog() {
    Get.dialog(AlertDialog(
      insetPadding: EdgeInsets.zero,
      content: const SizedBox(
        width: 300,
        height: 1,
      ),
      title: Text(
        'Выйти',
        style: AppFonts.poppinsBlackSemiBold(
          fontSize: 22,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            /// Will be Edited

            Get.back();
          },
          child: Text(
            'Cancel',
            style: AppFonts.poppinsBlackMedium(
              fontSize: 18,
              color: AppColors.dialogColor,
            ),
          ),
        ),
        TextButton(
          /// Will be Edited

          onPressed: () {
            Get.back();
          },
          child: Text(
            'Ok',
            style: AppFonts.poppinsBlackMedium(
              fontSize: 18,
              color: AppColors.dialogColor,
            ),
          ),
        ),
      ],
    ));
  }

  void openIOSDialog() {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(
          "Выйти",
          style: AppFonts.poppinsBlackSemiBold(
            fontSize: 22,
          ),
        ),
        actions: [
          CupertinoDialogAction(
              child: Text(
                "Cancel",
                style: AppFonts.poppinsBlackMedium(
                  fontSize: 18,
                  color: AppColors.dialogColor,
                ),
              ),

              /// Will be Edited

              onPressed: () {
                Get.back();
              }),
          CupertinoDialogAction(
              child: Text(
                "Ok",
                style: AppFonts.poppinsBlackMedium(
                  fontSize: 18,
                  color: AppColors.dialogColor,
                ),
              ),
              onPressed: () {
                /// Will be Edited
                Get.back();
              }),
        ],
      ),
    );
  }
}
