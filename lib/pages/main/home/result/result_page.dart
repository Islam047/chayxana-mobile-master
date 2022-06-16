import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_controller.dart';

class ResultPage extends StatelessWidget {
  static const String id = "/result_page";

  const ResultPage({Key? key}) : super(key: key);

  /// Doniyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: appbar(
          title: "My booking",
          leadingFunction: null,
          actionsFunction: null,
          centerTitle: true,
          leading: false,
          actions: true),
      body: GetBuilder(
        init: ResultController(),
        builder: (ResultController controller) => controller.bookingCheck ==
                true
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.check_circle_outline,
                      size: 84.0,
                      color: AppColors.greenCheck,
                    ),
                    SizedBox(height: 38),
                    Text(
                      "Have you booked a seat \n    we will wait for you",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      CupertinoIcons.clear_circled,
                      size: 84.0,
                      color: AppColors.redResult,
                    ),
                    SizedBox(height: 38),
                    Text(
                      "You have not booked a seat",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}