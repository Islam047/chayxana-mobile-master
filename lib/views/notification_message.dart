
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/constants/app_colors.dart';
import '../services/constants/app_fonts.dart';

class NotificationMessageWidget extends StatelessWidget {
  const NotificationMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
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
  }
}