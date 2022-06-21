import 'dart:convert';
import 'package:chayxana/models/regionDtoModel.dart';
import 'package:get/get.dart';

import '../../../../services/dio_service.dart';
import '../../../../services/util_service.dart';

class RegionController extends GetxController {
  RegionDto regionDto = RegionDto(id: 1, name: '');
  List<String> region = [
    "tashkent".tr,
    "andijan".tr,
    "bukhara".tr,
    "gulistan".tr,
    "jizzax".tr,
    "samarkand".tr,
    "namangan".tr,
    "fargana".tr,
    "kharazim".tr,
    "kashkadarya".tr,
    "sukhandarya".tr,
    "navaiy".tr,
    "karakalpaq".tr,
  ];

   String? regionName() {
    update();
    return regionDto.name;
  }

  @override
  void onInit() {
    super.onInit();
    apiGetRegion();
  }

   Future<void> apiGetRegion() async {
    var response = await NetworkService.GET(NetworkService.API_PROFILE_REGION,
        NetworkService.paramsUser("3fa85f64-5717-4562-b3fc-2c963f66afa6"));

    if (response == null) {
      Utils.fireSnackGetX("Some error!");
      return;
    }

    Map<String, dynamic> json = await jsonDecode(response);

    regionDto = RegionDto.fromJson(json['object'][0]);
  }

   Future<void> apiPUTRegion(String regionName) async {
    regionDto.name = regionName;
    await NetworkService.PUT(NetworkService.API_PROFILE_REGION,
        NetworkService.paramsUser('1'), regionDto.toJson());
    update();
  }
}
