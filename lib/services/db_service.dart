import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DBService {
  final GetStorage _database = GetStorage();

  static DBService get to => Get.find<DBService>();

  static Future<void> init() async {
    await Get.putAsync<DBService>(() async {
      final storageService = DBService();
      await GetStorage.init();
      return storageService;
    }, permanent: true);
  }

  Future<void> setData<T>(StorageKeys key, T value) async {
    await _database.write(key.name, value);
  }

  T? getData<T>(StorageKeys key) {
    return _database.read(key.name);
  }

  Future<void> deleteData(StorageKeys key) async {
    await _database.remove(key.name);
  }
}

enum StorageKeys {
  accessToken,
  firebaseToken,
  language,
  info,
  user,
  httpUrl,
}