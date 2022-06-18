import 'dart:convert';
import 'package:chayxana/models/regionDtoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/dio_service.dart';
import '../../../../services/util_service.dart';

class RegionController extends GetxController {
  RegionDto? regionDto;
  List<String> region = [
    "tashkent".tr,
    "andijan".tr,
    "Buxoro".tr,
    "Guliston".tr,
    "Jizzah".tr,
    "Samarqand".tr,
    "Namangan".tr,
    "Farg'ona".tr,
    "Xorazm".tr,
    "Qashqadaryo".tr,
    "Surxandaryo".tr,
    "Navoiy".tr,
    "Qoraqalpog'iston".tr,
  ];
  late Widget dividerChecker;

  @override
  void onInit() {
    super.onInit();
    apiGetRegion();
  }

  static Future<void> apiGetRegion() async {
    var response = await NetworkService.GET(NetworkService.API_PROFILE_REGION,
        NetworkService.paramsUser("3fa85f64-5717-4562-b3fc-2c963f66afa6"));

    if (response == null) {
      Utils.fireSnackGetX("Some error!");
      return;
    }

    Map<String, dynamic> json = jsonDecode(response);

    RegionDto regionDto = RegionDto.fromJson(json['object'][0]);
  }

  static Future<void> apiPUTRegion() async {
    RegionDto regionDto = RegionDto(id: 1, name: 'Imomboy lee');
    var response = NetworkService.PUT(NetworkService.API_PROFILE_REGION,
        NetworkService.paramsUser('1'), regionDto.toJson());
    print(response);
  }
}
