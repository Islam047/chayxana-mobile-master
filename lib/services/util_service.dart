import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static fireSnackGetX(String msg) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      titleText: Container(),
      margin: const EdgeInsets.only(bottom: kBottomNavigationBarHeight, left: 50, right: 50),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      borderRadius: 50,
      backgroundColor: Colors.grey.shade500.withOpacity(0.9),
      colorText: Colors.white,
    );
  }
}