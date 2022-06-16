import 'package:chayxana/pages/main/profile/faq/faq_controller.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQPage extends StatelessWidget {
  static const String id = "/faq_page";

  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FAQController>(
      init: FAQController(),
      builder: (controller) {
        return Scaffold(
          appBar: appbar('Вопросы и ответы', () {}),
          body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(
                  "${index + 1}. ${controller.faqQuestions[index % 4].title}",
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: AppColors.unSelectedTextColor,
                      fontWeight: FontWeight.w500),
                ),
                children: [
                  Text(
                    controller.faqQuestions[index % 4].content,
                    style: const TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 14,
                        color: AppColors.unSelectedTextColor,
                        fontWeight: FontWeight.w400),
                  )
                ],
              );
            },
          ),
        );
      }
    );
  }
}
