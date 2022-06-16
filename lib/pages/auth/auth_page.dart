import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/navigation_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'auth_controller.dart';

class AuthPage extends StatelessWidget {
  static const String id = "/auth_page";

  const AuthPage({Key? key}) : super(key: key);

  /// Doniyor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorScafoldBack,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) => Container(
                padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "registration".tr,
                      style: const TextStyle(
                          color: AppColors.unSelectedTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      "full_name".tr,
                      style: const TextStyle(
                          color: AppColors.unSelectedTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),

                    const SizedBox(height: 10),

                    /// Ful name TextField
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.activeColor,
                        borderRadius: BorderRadius.circular(12),
                        //  border: Border.all(width: 1, color: Colors.red),
                      ),
                      child: TextField(
                        controller: AuthController.fullNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "username".tr,
                          contentPadding: const EdgeInsets.only(left: 8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 42),

                    Text("phone_number".tr,
                        style: const TextStyle(fontSize: 13)),
                    const SizedBox(height: 10),

                    /// Phone Field
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.activeColor,
                        borderRadius: BorderRadius.circular(12),
                        //  border: Border.all(width: 1, color: Colors.red),
                      ),
                      child: IntlPhoneField(
                        enabled: true,
                        flagsButtonMargin: const EdgeInsets.all(10),
                        controller: AuthController.phoneController,
                        disableLengthCheck: true,
                        flagsButtonPadding: const EdgeInsets.all(5),
                        dropdownIconPosition: IconPosition.trailing,
                        invalidNumberMessage: "",
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            hintText: "●● ●●● ●● ●●",
                            contentPadding: const EdgeInsets.only(top: 15),
                            border: InputBorder.none),
                        initialCountryCode: 'UZ',
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// Information Text
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "using_application".tr,
                                style: const TextStyle(
                                    color: AppColors.borderColor),
                              ),
                              TextSpan(
                                text: "agreements".tr,
                                style: const TextStyle(
                                    color: AppColors.unSelectedTextColor),
                              ),
                              TextSpan(
                                  text: 'information_messages'.tr,
                                  style: const TextStyle(
                                    color: AppColors.borderColor,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    /// Next Button
                    NavigationButton(text: "next".tr)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
