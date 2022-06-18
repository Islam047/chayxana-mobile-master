import 'package:flutter/material.dart';

import '../services/constants/app_colors.dart';
class PersonalInformation extends StatelessWidget {
  String? whatInfo;
  String? image;
  String? additional;

   PersonalInformation({ this.whatInfo,this.image,this.additional,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(whatInfo!,
              style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.unSelectedTextColor,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500)),
          Row(
            children: [
              Text(additional!,
                  style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w500)),
              IconButton(

                icon: Image.asset(image!), onPressed:() {

              },
              )
            ],
          )
        ],
      ),
    );
  }
}
