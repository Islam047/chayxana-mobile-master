import 'dart:async';

import 'package:chayxana/services/db_service.dart';
import 'package:get/get.dart';

import '../language/language_page.dart';


class SplashController extends GetxController {
  bool firstVisit() {
    return DBService.to.getData(StorageKeys.language) == null;
  }

  void openNextPage() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => const LanguagePage());
    });
  }

  @override
  void onInit() {
    openNextPage();
    super.onInit();
  }
}
