import 'db_service.dart';
import 'di_service.dart';

class InitService {
  static Future<void> init() async {
    // GetStorage Database
    await DBService.init();

    // Dependency Injection
    await DIService.init();
  }
}