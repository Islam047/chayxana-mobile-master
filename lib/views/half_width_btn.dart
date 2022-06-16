import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InternalButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color btnColor;
  final Function()? function;

  const InternalButton(
      {Key? key,
        this.text = '',
        this.textColor = AppColors.activeColor,
        this.btnColor = AppColors.mainColor,
        this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () {},
      height: 50,
      minWidth: Get.width * .45,
      color: btnColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Text(
        text.tr,
        style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
