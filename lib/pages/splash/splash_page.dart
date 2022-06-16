import 'package:chayxana/pages/splash/splash_contoller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/svg_widget.dart';

class SplashPage extends StatelessWidget {
  static const String id = '/splash_page';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OpenSVG(
                    path: AppAssets.logoIC,
                    width: Get.width * 0.39,
                    isGradient: true,
                  ),
                  SizedBox(
                      height: Get.height * .06,
                      width: Get.width * .39,
                      child: const OpenSVG(
                        path: AppAssets.splashLogo2IC,
                        isGradient: true,
                        height: 52,
                        width: 162,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
