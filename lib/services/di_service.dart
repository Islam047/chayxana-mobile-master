import 'package:chayxana/pages/auth/auth_controller.dart';
import 'package:chayxana/pages/intro/intro_controller.dart';
import 'package:chayxana/pages/language/language_controller.dart';
import 'package:chayxana/pages/main/history/history_controller.dart';
import 'package:chayxana/pages/main/history/notification/notification_controller.dart';
import 'package:chayxana/pages/main/home/booking/booking_controller.dart';
import 'package:chayxana/pages/main/home/detail/detail_controller.dart';
import 'package:chayxana/pages/main/home/filter_page/filter_controller.dart';
import 'package:chayxana/pages/main/home/gallery/gallery_controller.dart';
import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:chayxana/pages/main/home/result/result_controller.dart';
import 'package:chayxana/pages/main/home/setting_detail/setting_detail_controller.dart';
import 'package:chayxana/pages/main/main_controller.dart';
import 'package:chayxana/pages/main/profile/add_card/add_card_controller.dart';
import 'package:chayxana/pages/main/profile/faq/faq_controller.dart';
import 'package:chayxana/pages/main/profile/feedback/feedback_controller.dart';
import 'package:chayxana/pages/main/profile/profile_controller.dart';
import 'package:chayxana/pages/main/profile/region/region_controller.dart';
import 'package:chayxana/pages/sms_verification/sms_verification_controller.dart';
import 'package:chayxana/pages/splash/splash_contoller.dart';
import 'package:get/get.dart';

class DIService {
  static Future<void> init() async {
    // Services

    // Controllers
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<SmsVerificationController>(() => SmsVerificationController(),
        fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<RegionController>(() => RegionController(), fenix: true);
    Get.lazyPut<FeedbackController>(() => FeedbackController(), fenix: true);
    Get.lazyPut<FAQController>(() => FAQController(), fenix: true);
    Get.lazyPut<AddCardController>(() => AddCardController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SettingDetailController>(() => SettingDetailController(),
        fenix: true);
    Get.lazyPut<ResultController>(() => ResultController(), fenix: true);
    Get.lazyPut<GalleryController>(() => GalleryController(), fenix: true);
    Get.lazyPut<FilterController>(() => FilterController(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
    Get.lazyPut<BookingController>(() => BookingController(), fenix: true);
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
    Get.lazyPut<NotificationController>(() => NotificationController(),
        fenix: true);
    Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
    Get.lazyPut<IntroController>(() => IntroController(), fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
