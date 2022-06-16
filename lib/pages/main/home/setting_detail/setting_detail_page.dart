import 'package:chayxana/pages/main/home/setting_detail/setting_detail_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/views/choose_room.dart';
import 'package:chayxana/views/common_views.dart';
import 'package:chayxana/views/half_width_btn.dart';
import 'package:chayxana/views/timeline_widget/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SettingDetailPage extends StatelessWidget {
  static const String id = '/setting_detail_page';

  const SettingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingDetailController>(
      init: SettingDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: appbar(controller.nowString(), () => controller.goBack()),
          body: SizedBox(
            width: Get.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                DropDownItems(
                  title: "str_guests",
                  itemName: "People count",
                  selectedItem: () {},
                  items: controller.maxNumberPeople,
                  otherItem: controller.minNumberPeople,
                ),
                customDivider(),
                // timeLine
                Container(
                  height: Get.height * .275,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.borderColor.withOpacity(0.5),
                          width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropDownItems(
                          title: "str_choose_date",
                          selectedItem: () => controller.chooseMonth,
                          items: controller.months,
                          itemName: controller.selectedMonth(
                              controller.months[controller.chooseMonth])),
                      DatePicker(
                        controller.now,
                        width: Get.width * .175,
                        height: Get.height * .14,
                        dateTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 32,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w600),
                        dayTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w400),
                        locale: controller.locale,
                        selectionColor: AppColors.mainColor,
                        selectedTextColor: AppColors.activeColor,
                        deactivatedColor: AppColors.borderColor,
                        onDateChange: (date) {},
                        inactiveDates: [DateTime(2022, 05, 9)],
                      ),
                    ],
                  ),
                ),
                customDivider(),

                //timeOfWork
                chooseItem(
                    text: "str_choose_time",
                    controller: controller,
                    items: controller.workTime,
                    selectedItem: controller.selectedHour),

                customDivider(),

                //freeRooms

                Container(
                  height: 376,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.borderColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.rooms.length,
                    itemBuilder: (context, index) {
                      return ChooseRoom(
                          selected: index == controller.selectedRoom,
                          onTap: () => controller.chooseRoom(index),
                          roomNumber: controller.rooms[index][0],
                          maxPeople: controller.rooms[index][2],
                          minPeople: controller.rooms[index][1],
                          price: controller.rooms[index][3]);
                    },
                  ),
                ),

                customDivider(),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InternalButton(
                      text: "str_clear",
                      function: () {},
                      textColor: AppColors.unSelectedTextColor,
                      btnColor: AppColors.btnColor,
                    ),
                    const SizedBox(width: 9),
                    InternalButton(text: "str_next", function: () {}),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DropDownItems<T> extends StatelessWidget {
  final List<T> items;
  T selectedItem;
  final List<T> otherItem;
  final String title;
  final String itemName;

  DropDownItems({
    this.otherItem = const [],
    required this.selectedItem,
    required this.items,
    this.title = '',
    this.itemName = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' ${title.tr}',
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                color: AppColors.unSelectedTextColor,
                fontWeight: FontWeight.w600),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor, width: 1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Text(
                  ' ${itemName.tr}',
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: AppColors.unSelectedTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                PopItem(
                    selectedItem: selectedItem,
                    items: items,
                    otherItem: otherItem)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopItem<T> extends StatelessWidget {
  final List<T> items;
  T? selectedItem;
  final List<T> otherItem;

  PopItem({
    this.otherItem = const [],
    required this.selectedItem,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        offset: const Offset(15, 35),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.arrow_downward,
          color: Color(0xFFC2C2C2),
        ),
        itemBuilder: (context) {
          return items
              .map((e) => PopupMenuItem(
                  onTap: () => selectedItem = e,
                  value: e,
                  child: Row(
                    children: [
                      (otherItem.isNotEmpty)
                          ? Text('${otherItem[items.indexOf(e)]} - '
                              '$e')
                          : Text(DateFormat('MMMM')
                              .format(DateTime(2022, int.parse(e.toString())))),
                    ],
                  )))
              .toList();
        });
  }
}
