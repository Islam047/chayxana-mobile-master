import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFonts {
  static const String poppins = "Poppins";

  static TextStyle poppinsBlackItalic({double? fontSize, Color? color, FontStyle? fontStyle}) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: poppins,
      fontStyle: fontStyle,
      color: color,
      fontSize: fontSize,
    );
  }
  static TextStyle poppinsBlackMedium({double? fontSize, Color? color, FontStyle? fontStyle}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: poppins,
      fontStyle: fontStyle,
      color: color,
      fontSize: fontSize,
    );
  }


  static TextStyle poppinsMediumChat() {
    return const TextStyle(
        fontSize: 15,color: AppColors.unSelectedTextColor,fontWeight: FontWeight.w500
    );
  }
  static TextStyle poppinsBlackSemiBold({double? fontSize, Color? color, FontStyle? fontStyle}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: poppins,
      fontStyle: fontStyle,
      color: color,
      fontSize: fontSize,
    );
  }
}