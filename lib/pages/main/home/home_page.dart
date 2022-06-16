import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SafeArea(
              child: Stack(
                children: [
                  _mapView(controller),
                  _searchBar(controller),
                ],
              ),
            );
          }),
    );
  }

  _searchBar(HomeController controller) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: Get.width * 0.7,
            height: 50,
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: AppColors.activeColor,
                borderRadius: BorderRadius.circular(200)),
            child: TextField(
              controller: controller.searchTextController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: AppColors.unSelectedTextColor,
                  )),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4324)),
              child: const Icon(
                Icons.list_alt_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }

  YandexMap _mapView(HomeController controller) {
    return YandexMap(
      tiltGesturesEnabled: true,
      zoomGesturesEnabled: true,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      modelsEnabled: true,
      nightModeEnabled: false,
      indoorEnabled: false,
      liteModeEnabled: false,
      onMapCreated: (YandexMapController yandexMapController) async {
        controller.yandexMapController = yandexMapController;
        final cameraPosition =
            await controller.yandexMapController.getCameraPosition().then(
          (value) async {
            await controller.yandexMapController.moveCamera(
                CameraUpdate.newCameraPosition(const CameraPosition(
                    target: Point(latitude: 41.2995, longitude: 69.2401),
                    zoom: 12.0)));
          },
        );
      },
    );
  }
}
