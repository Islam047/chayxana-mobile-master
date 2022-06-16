import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:chayxana/views/main_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feedback_controller.dart';

class FeedBackPage extends StatelessWidget {
  static const String id = "/feedback_page";

  const FeedBackPage({Key? key}) : super(key: key);

  /// Doniyor

  @override
  Widget build(BuildContext context) {
    Object? isRadioSelected = false;
    return Scaffold(
      /// AppBar
      appBar: appbar(
          title: "Feedback",
          leadingFunction: null,
          actionsFunction: null,
          centerTitle: false,
          leading: true,
          actions: true),
      body: GetBuilder(
        init: FeedbackController(),
        builder: (FeedbackController controller) =>

            ///   Body
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(
                  left: 12,
                ),
                child: const Text(
                  "Share your \napp opinion",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.only(right: 15),
              width: Get.width,
              height: 260,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.activeColor),
              child: Column(
                children: [
                  /// 1 RadioListTile
                  SizedBox(
                    height: 52,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: AppColors.unSelectedTextColor,
                          disabledColor: AppColors.unSelectedTextColor),
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Name and Address'),
                        activeColor: AppColors.mainColor,
                        selectedTileColor: AppColors.mainColor,
                        value: 1,
                        groupValue: isRadioSelected,
                        onChanged: (v) {
                          isRadioSelected = v;
                          controller.changeButtonColor();
                        },
                      ),
                    ),
                  ),

                  const Divider(
                    height: 1,
                    color: AppColors.borderColor,
                    indent: 10,
                  ),

                  /// 2 RadioListTile

                  SizedBox(
                    height: 52,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: AppColors.unSelectedTextColor,
                          disabledColor: AppColors.unSelectedTextColor),
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Name and Address'),
                        activeColor: AppColors.mainColor,
                        selectedTileColor: AppColors.mainColor,
                        value: 2,
                        groupValue: isRadioSelected,
                        onChanged: (v) {
                          isRadioSelected = v;
                          controller.changeButtonColor();
                        },
                      ),
                    ),
                  ),

                  const Divider(
                    height: 1,
                    color: AppColors.borderColor,
                    indent: 10,
                  ),

                  /// Email TextField
                  const SizedBox(
                    height: 52,
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        hintText: "The answer will be sent by mail",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.greyText),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const Divider(
                    height: 1,
                    color: AppColors.borderColor,
                    indent: 10,
                  ),

                  /// Comment TextField
                  SizedBox(
                    height: 100,
                    width: Get.width,
                    child: const TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        hintText: "Your comment",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.greyText),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Send Button
            MainButton(
              color: controller.check == true
                  ? AppColors.mainColor
                  : AppColors.activeColor,
              onPressed: () {},
              text: "Send",
            ),

            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}