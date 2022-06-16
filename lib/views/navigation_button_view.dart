import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/sms_verification/sms_verification_page.dart';

class NavigationButton extends StatelessWidget {
  final String text;

  const NavigationButton({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 14.93,
      width: Get.width / 1.52,
      margin: EdgeInsets.only(
          left: Get.width / 5.83, right: Get.width / 5.83, bottom: 45),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.mainColor),
      child: MaterialButton(
        onPressed: () {
          Get.off(const SmsVerificationPage());
        },
        child: Text(
          text.tr,
          style: const TextStyle(
              color: AppColors.activeColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
