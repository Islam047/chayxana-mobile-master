import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'history_controller.dart';

class HistoryPage extends StatelessWidget {
  static const String id = "/history_page";

  const HistoryPage({Key? key}) : super(key: key);

  /// Doniyor
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d-MMMM').format(now);

    return GetBuilder(
        init: HistoryController(),
        builder: (HistoryController controller) => Scaffold(
              appBar: appbar(
                  title: "History Booking",
                  leadingFunction: null,
                  actionsFunction: null,
                  centerTitle: false,
                  leading: true),
              body: ListView(
                children: [
                  controller.data.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: 18,
                          itemBuilder: (context, index) {
                            /// All Container
                            return Container(
                              padding: EdgeInsets.only(top: Get.height / 64),
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              height: 167,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: AppColors.activeColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      /// Image Container

                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, right: 8),
                                        height: 95,
                                        width: Get.width / 3.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://media-cdn.tripadvisor.com/media/photo-s/15/7d/d1/67/caption.jpg",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),

                                      Flexible(
                                        flex: 2,
                                        child: SizedBox(
                                          height: 95,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              /// Name Tea Hause
                                              Text(
                                                controller.limitedText(
                                                    "Tea House Vostok"),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(height: 4),

                                              /// Location Tea House
                                              Flexible(
                                                child: Text(
                                                  controller.limitedText(
                                                    " Location: Street Darxon 45",
                                                  ),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              const SizedBox(height: 12),

                                              /// Order date time  room number
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: Get.width / 1.682,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: index.isOdd
                                                            ? AppColors.borderColor
                                                            : AppColors.btnColor
                                                        //Color.fromRGBO(23, 183, 0, 0.7),
                                                        ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            formattedDate,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                        //  SizedBox(width:5,),

                                                        Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.symmetric(
                                                                  vertical: BorderSide(
                                                                      color: index.isOdd
                                                                          ? AppColors
                                                                              .unSelectedTextColor
                                                                          : AppColors
                                                                              .activeColor,
                                                                      width:
                                                                          1))),
                                                          width: 45,
                                                          height: Get.height *
                                                              0.061,
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                              "20:30",
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center),
                                                        ),
                                                        //  SizedBox(width: 5,),

                                                        const Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                                "3-room",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(
                                      height: 1, color: AppColors.borderColor),
                                  SizedBox(
                                    height: 45,
                                    width: Get.mediaQuery.size.width,
                                    child: index.isOdd

                                        /// Order Completed

                                        ? MaterialButton(
                                            child: const Text("Order completed",
                                                style: TextStyle(
                                                    color: AppColors.grey)),
                                            onPressed: () => orderBottomSheet(),
                                          )

                                        /// Cancel Order Button
                                        : MaterialButton(
                                            child: const Text("Cancel order",
                                                style: TextStyle(
                                                    color: AppColors.red)),
                                            onPressed: () {},
                                          ),
                                  ),
                                ],
                              ),
                            );
                          })

                      ///   Center No orders
                      : Center(
                          heightFactor: Get.height / 25.6,
                          child: const Text(
                            "No orders yet",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.notFoundText),
                          ),
                        )
                ],
              ),
            ));
  }

  /// Order BottomSheet Method
  orderBottomSheet() {
    return Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.only(bottom: Get.height / 14.93),
      height: Get.height / 4.81,
      width: Get.height,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Book again",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          Text("Call",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          Text("Abaut teahouse",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ],
      ),
    ));
  }
}
