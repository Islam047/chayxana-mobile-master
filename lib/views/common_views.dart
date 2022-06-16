import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/constants/app_colors.dart';

AppBar appbar(
   String text, Function() function) {
  return AppBar(
    leading: IconButton(
        onPressed: function,
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: AppColors.unSelectedTextColor,
        )),
    elevation: 0,
    backgroundColor: AppColors.activeColor,
    centerTitle: true,
    title: Text(
      text,
      style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: AppColors.unSelectedTextColor,
          fontWeight: FontWeight.w700),
    ),
  );
}

Container customDivider() {
  return Container(
      height: 1,
      width: Get.width,
      color: AppColors.borderColor.withOpacity(0.5));
}
