import 'package:get/get.dart';

class FeedbackController extends GetxController {
  bool check = false;
  void changeButtonColor () {
    check = true;
    update();
  }
}