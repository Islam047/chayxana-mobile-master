import 'package:chayxana/services/db_service.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class SettingDetailController extends GetxController {
  int selectedDate = 0;
  int chooseMonth = 0;
  int? selectedRoom;
  int? selectedHour;
  String locale = DBService.to.getData(StorageKeys.language) ?? 'en';
  DateTime now = DateTime.now();

  List rooms = [
    [1, 12, 18, 100],
    [2, 15, 16, 200],
    [5, 10, 12, 100],
    [17, 8, 10, 80],
    [19, 12, 18, 999],
  ];

  List<int> maxNumberPeople = [10, 12, 15, 18, 20];
  List<int> minNumberPeople = [6, 8, 10, 12, 15];
  List<String> workTime = [
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30'
  ];

  List<String> months =
  List.generate(12, (index) => '${(DateTime.now().month + index) % 12}');

  String nowString() =>
      DateFormat("EEEE d-MMMM", locale).format(now).toUpperCase();

  String selectedMonth(String selectedMonth) {
    DateTime date = DateTime(0,int.parse(selectedMonth) );
    return DateFormat("MMMM", locale).format(date).toUpperCase();
  }

  @override
  void onInit() {
    initializeDateFormatting();
    super.onInit();
  }

  void goBack() => Get.back();

  void chooseRoom(int index) {
    selectedRoom = index;
    Get.log(selectedRoom.toString());
    update();
  }

  void chooseHour(int index) {
    selectedHour = index;
    update();
  }


}