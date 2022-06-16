import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'db_service.dart';
import 'locals/en_us.dart';
import 'locals/ru_ru.dart';
import 'locals/uz_uz.dart';

class LangService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'ru_RU': ruRU, // lang/ru_ru.dart
        'uz_UZ': uzUZ, // lang/uz_uz.dart
      };

  static const fallbackLocale = Locale('en', 'US');

  static final items = [
    'English',
    'Русский',
    'O\'zbekcha',
  ];

  static final langs = [
    'en',
    'ru',
    'uz',
  ];

  static final List<Locale> locales = [
    const Locale('en', 'US'),
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ'),
  ];

  static final locale = defLanguage(
      DBService.to.getData<String>(StorageKeys.language) ??
          LangService.langs[0]);

  static String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if (lan == "ru_RU") return langs[1];
    if (lan == "uz_UZ") return langs[2];
    return langs[1];
  }

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      DBService.to.setData<String>(StorageKeys.language, lang);
    }
  }

  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }
}
