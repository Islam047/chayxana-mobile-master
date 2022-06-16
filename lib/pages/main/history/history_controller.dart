import 'package:get/get.dart';

class HistoryController extends GetxController {
  String data = "date";

  String limitedText(String text) {
    return text.length > 27 ? "${text.substring(0, 27)}..." : text;
  }
}