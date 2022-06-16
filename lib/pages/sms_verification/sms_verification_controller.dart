import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsVerificationController extends GetxController {
  /// #Otabek
  TextEditingController textEditingController = TextEditingController();
  String keyOfVerifaction = "123456";

// ignore: close_sinks
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  var limitedTime = 45.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    calculateTime();
  }

  void calculateTime() async {
    for (int i = 0; i < 45; i++) {
      await Future.delayed(const Duration(seconds: 1));
      limitedTime.value -= 1;
      update();
    }
  }
}
