import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'region_controller.dart';

class RegionPage extends StatelessWidget {
  static const String id = "/region_page";

  const RegionPage({Key? key}) : super(key: key);

  /// Doniyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: appbar(
          title: "Region",
          leadingFunction: null,
          actionsFunction: null,
          centerTitle: false,
          leading: true),

      body: GetBuilder(
        init: RegionController(),
        builder: (RegionController controller) =>

            /// Body
            ListView(
          children: [
            /// Search Container
            Container(
              width: double.infinity,
              height: 44,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: AppColors.activeColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.unSelectedTextColor,
                    ),
                    hintText: "Search".trim(),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(151, 151, 151, 1)),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20),

            /// Region List Container
            Container(
              margin: const EdgeInsets.only(bottom: 94),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Colors.white),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.region.length,
                  itemBuilder: (context, index) {
                    index == controller.region.length - 1
                        ? controller.dividerChecker = Container()
                        : controller.dividerChecker = const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                                height: 1, color: AppColors.borderColor),
                          );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          height: 52,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.region[index],
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.unSelectedTextColor),
                          ),
                        ),
                        controller.dividerChecker
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}