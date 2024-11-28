import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:ovolutter/data/controller/splash/splash_controller.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/data/repo/splash/splash_repo.dart';

Future<Map<String, Map<String, String>>> initDependency() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences, fenix: true);
  Get.lazyPut(() => GeneralSettingRepo());
  Get.lazyPut(() => SplashRepo());
  Get.lazyPut(() => SplashController(repo: Get.find()));
  Get.lazyPut(() => GeneralSettingRepo());

  Map<String, Map<String, String>> language = {};
  language['en_US'] = {'': ''};

  return language;
}
