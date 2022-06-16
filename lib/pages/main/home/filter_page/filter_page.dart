import 'package:chayxana/pages/main/home/filter_page/filter_controller.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FilterPage extends StatelessWidget {
  static const String id = "/filter_page";
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
        init: FilterController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: Get.height / 5,
                centerTitle: true,
                title: const Text(
                  "Филтьтр",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "poppins",
                    color: Colors.white,
                  ),
                ),
                elevation: 0.0,
                backgroundColor: const Color(0xff191919),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: AppColors.dashboardRowButtonIsNotPressed,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.activeColor,
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          child: TextField(
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              //  controller: searchController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintText: "Поиск",
                                hintStyle: TextStyle(
                                    color: AppColors.grey,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Сервисы Чайхана",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body:SingleChildScrollView(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChooseComfort(
                      textOfButton: "Забронировать комната",
                      iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                      number: 1,
                      isTab: true,
                      widthOfIT: 300,
                    ),
                    const ChooseComfort(
                      textOfButton: "Бонусная программа",
                      iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                      number: 1,
                      isTab: true,
                      widthOfIT: 270,
                    ),
                    const ChooseComfort(
                      textOfButton: "Оплата счёта",
                      iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                      number: 1,
                      isTab: true,
                      widthOfIT: 230,
                    ),
                    const ChooseComfort(
                      textOfButton: "Предзаказ",
                      iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                      number: 1,
                      isTab: true,
                      widthOfIT: 200,
                    ),
                    const Text(
                      "Сервисы Чайхана",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins",
                        color: AppColors.unSelectedTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChooseComfort(
                          textOfButton: "Веранды",
                          iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                          number: 1,
                          isTab: true,
                          widthOfIT: Get.width / 2.2,
                        ),
                        ChooseComfort(
                          textOfButton: "Парковка",
                          iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                          number: 1,
                          isTab: true,
                          widthOfIT: Get.width / 2.2,
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChooseComfort(
                          textOfButton: "Веранды",
                          iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                          number: 1,
                          isTab: true,
                          widthOfIT: Get.width / 2.2,
                        ),
                        ChooseComfort(
                          textOfButton: "Парковка",
                          iconsPath: "assets/icons/icons/ic_calendar_text.svg",
                          number: 1,
                          isTab: true,
                          widthOfIT: Get.width / 2.2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 52,
                            width: Get.width/2-20,
                            decoration: BoxDecoration(color: const Color(0xffededed),borderRadius: BorderRadius.circular(12)),
                            child: MaterialButton(onPressed: (){},
                              child: const Text("Очистить"),)

                        ),
                        Container(
                            height: 52,
                            width: Get.width/2-20,
                            decoration: BoxDecoration(color: const Color(0xff17B700),borderRadius: BorderRadius.circular(12)),
                            child: MaterialButton(onPressed: (){},
                              child: const Text("Применить"),)

                        )
                      ],
                    )
                  ],
                ),
              )));
        });
  }
}

// ignore: must_be_immutable
class ChooseComfort extends StatelessWidget {
  final int number;
  final String textOfButton;
  final String iconsPath;
  final bool isTab;
  final double widthOfIT;
  final Function()? function;

  const ChooseComfort(
      {Key? key,
        this.function,
        required this.textOfButton,
        required this.number,
        required this.iconsPath,
        required this.isTab,
        required this.widthOfIT})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: widthOfIT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: !isTab ? const Color(0xff17B700) : const Color(0xffFFFFFF),
        ),
        child: MaterialButton(
            minWidth: 50,
            onPressed: () {},
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: OpenSVG(
                      path: iconsPath,
                      color: Colors.black,
                      isGradient: false,
                    )),
                Text(
                  textOfButton,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "inter",
                      fontSize: 18,
                      color: Colors.black),
                ),
              ],
            )));
  }
}