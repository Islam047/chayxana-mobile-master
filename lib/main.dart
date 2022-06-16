import 'package:chayxana/pages/auth/auth_page.dart';
import 'package:chayxana/pages/intro/intro_page.dart';
import 'package:chayxana/pages/language/language_page.dart';
import 'package:chayxana/pages/main/history/history_page.dart';
import 'package:chayxana/pages/main/history/notification/notification_page.dart';
import 'package:chayxana/pages/main/home/booking/booking_page.dart';
import 'package:chayxana/pages/main/home/detail/detail_page.dart';
import 'package:chayxana/pages/main/home/filter_page/filter_page.dart';
import 'package:chayxana/pages/main/home/gallery/gallery_page.dart';
import 'package:chayxana/pages/main/home/home_page.dart';
import 'package:chayxana/pages/main/home/result/result_page.dart';
import 'package:chayxana/pages/main/home/setting_detail/setting_detail_page.dart';
import 'package:chayxana/pages/main/main_page.dart';
import 'package:chayxana/pages/main/profile/add_card/add_card_page.dart';
import 'package:chayxana/pages/main/profile/faq/faq_page.dart';
import 'package:chayxana/pages/main/profile/feedback/feedback_page.dart';
import 'package:chayxana/pages/main/profile/profile_page.dart';
import 'package:chayxana/pages/main/profile/region/region_page.dart';
import 'package:chayxana/pages/sms_verification/sms_verification_page.dart';
import 'package:chayxana/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'services/init_service.dart';
import 'services/lang_service.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await InitService.init();

  LangService.changeLocale("ru");

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chayxana Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const ProfilePage(),
      // Localization
      translations: LangService(),
      locale: LangService.locale,
      fallbackLocale: LangService.fallbackLocale,
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        LanguagePage.id: (context) => const LanguagePage(),
        IntroPage.id: (context) => const IntroPage(),
        MainPage.id: (context) => const MainPage(),
        HomePage.id: (context) => const HomePage(),
        FilterPage.id: (context) => const FilterPage(),
        BookingPage.id: (context) => const BookingPage(),
        DetailPage.id: (context) => const DetailPage(),
        GalleryPage.id: (context) => const GalleryPage(),
        ResultPage.id: (context) => const ResultPage(),
        SettingDetailPage.id: (context) => const SettingDetailPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        FAQPage.id: (context) => const FAQPage(),
        FeedBackPage.id: (context) => const FeedBackPage(),
        RegionPage.id: (context) => const RegionPage(),
        HistoryPage.id: (context) => const HistoryPage(),
        NotificationPage.id: (context) => const NotificationPage(),
        AuthPage.id: (context) => const AuthPage(),
        SmsVerificationPage.id: (context) => const SmsVerificationPage(),
        AddCardPage.id: (context) => const AddCardPage()
      },
    );
  }
}


