import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../views/search_view.dart';
import 'region_controller.dart';

// #region_page
class RegionPage extends SearchDelegateCustom {
  static const String id = "/region_page";

  RegionPage({Key? key})
      : super(
    searchFieldLabel: "region".tr,
    searchFieldDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );

  // #results
  @override
  Widget buildResults(BuildContext context) {
    appBarTheme(context);
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }

  // #regions
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = RegionController().region.where(
          (element) {
        final result = element.toLowerCase();
        final input = query.toLowerCase();
        return result.contains(input);
      },
    ).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return Container(
            color: AppColors.activeColor,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      suggestion,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 1,
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
              onTap: () {
                query = suggestion;
              },
            ),
          );
        });
  }

  // #appbar
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
            toolbarHeight: 140,
            elevation: 0.0,
            backgroundColor: AppColors.colorRegionBackground));
  }
}