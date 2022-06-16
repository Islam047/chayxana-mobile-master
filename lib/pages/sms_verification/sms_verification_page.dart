import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'sms_verification_controller.dart';

class SmsVerificationPage extends StatelessWidget {
  static const String id = "/sms_verification_page";

  const SmsVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsVerificationController>(
      init: SmsVerificationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.colorScafoldBack,
          body: ListView(
            children: [
              SizedBox(height: Get.height / 19),

              /// First text for warning enter code to textfields
              Container(
                margin: EdgeInsets.only(left: Get.width / 23),
                child: const Text(
                  "Введите код из СМС",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 17.9),
              Center(
                /// information for how to register sms code
                child: Column(
                  children: [
                    const Text(
                      "Пожалуйста, введите 6-значный код",
                      style: TextStyle(fontSize: 13),
                    ),
                    const Text(
                      "подтверждения,который мы вам отправили",
                      style: TextStyle(fontSize: 13),
                    ),

                    /// picode fields
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: ListView(
                          children: <Widget>[
                            const SizedBox(height: 30),
                            Form(
                              key: controller.formKey,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10),
                                  child: PinCodeTextField(
                                    appContext: context,
                                    pastedTextStyle: const TextStyle(
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 6,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    blinkWhenObscuring: true,
                                    animationType: AnimationType.fade,
                                    validator: (v) {
                                      if (v!.length < 3) {
                                        return "Please full fill";
                                      } else {
                                        return null;
                                      }
                                    },
                                    pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderWidth: 0,
                                        selectedFillColor: AppColors.mainColor,
                                        borderRadius:
                                            BorderRadius.circular(10.12),
                                        fieldHeight: Get.height / 13.57,
                                        fieldWidth: Get.width / 8.26,
                                        activeFillColor: AppColors.activeColor,
                                        inactiveColor: AppColors.activeColor,
                                        inactiveFillColor:
                                            AppColors.activeColor),
                                    cursorColor: AppColors.unSelectedTextColor,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    enableActiveFill: true,
                                    controller:
                                        controller.textEditingController,
                                    keyboardType: TextInputType.number,
                                    boxShadows: const [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      )
                                    ],
                                    onCompleted: (v) {},
                                    onChanged: (value) {},
                                    beforeTextPaste: (text) {
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return true;
                                    },
                                  )),
                            ),
                            SizedBox(height: Get.height / 12),

                            /// timer calculator
                            Center(
                              child: Text(
                                "Отправить код еще раз через ...00:${controller.limitedTime}",
                                style: const TextStyle(
                                    fontSize: 13, color: AppColors.borderColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: Get.height / 14.93,
            width: Get.width / 1.07,
            margin:
                EdgeInsets.only(left: Get.width / 23, right: Get.width / 23),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(12),
            ),

            /// Button for check pincode
            child: MaterialButton(
              onPressed: () {
                controller.calculateTime();
                controller.formKey.currentState!.validate();
                // conditions for validating
                if (controller.currentText.length != 6 ||
                    controller.currentText != controller.keyOfVerifaction) {
                  Get.snackbar("pincode", "notug'ri parol kiritildi");
                } else {}
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.check_circle_outline,
                      color: AppColors.activeColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Подтверждать",
                      style: TextStyle(
                          color: AppColors.activeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
