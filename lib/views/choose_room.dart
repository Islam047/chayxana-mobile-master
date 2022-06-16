import 'package:chayxana/pages/main/home/setting_detail/setting_detail_controller.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseRoom extends StatelessWidget {
  final int roomNumber;
  final bool selected;
  final int maxPeople;
  final int minPeople;
  final int price;
  final Function() onTap;

  const ChooseRoom(
      {Key? key,
        required this.onTap,
        required this.selected,
        required this.roomNumber,
        required this.maxPeople,
        required this.minPeople,
        required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: selected ? AppColors.mainColor : AppColors.activeColor,
            border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(12)),
        height: 76,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            columnWidget(
                firstItem: roomNumber, text: 'str_room'.tr, selected: selected),
            columnWidget(
                firstItem: minPeople,
                secondItem: maxPeople,
                text: 'str_people_count'.tr,
                selected: selected),
            columnWidget(
                firstItem: price,
                text: 'str_price'.tr,
                unit: 'k',
                selected: selected),
          ],
        ),
      ),
    );
  }

  Column columnWidget(
      {int firstItem = 0,
        bool selected = false,
        int? secondItem,
        String text = '',
        String unit = ''}) {
    return Column(
      children: [
        Text(
          firstItem.toString() +
              (secondItem != null ? " - $secondItem" : '') +
              unit,
          style: TextStyle(
              color: selected
                  ? AppColors.activeColor
                  : AppColors.unSelectedTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        Text(
          text.tr,
          style: TextStyle(
              color: selected
                  ? AppColors.activeColor
                  : AppColors.unSelectedTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
      ],
    );
  }

}


Widget chooseItem<T>({required SettingDetailController controller,
  required String text,
  required List<T> items,
  required int? selectedItem}) {
  return Container(
    height: Get.height * .023 * items.length + 60,
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' ${text.tr}',
          style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              color: AppColors.unSelectedTextColor,
              fontWeight: FontWeight.w600),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4,
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              mainAxisSpacing: 4),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => controller.chooseHour(index),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                margin:
                const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                decoration: BoxDecoration(
                    color: index == selectedItem
                        ? AppColors.mainColor
                        : AppColors.activeColor,
                    border: Border.all(
                        color: AppColors.borderColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  items[index].toString(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      color: index == selectedItem
                          ? AppColors.activeColor
                          : AppColors.unSelectedTextColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}