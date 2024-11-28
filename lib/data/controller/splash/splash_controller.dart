import 'dart:convert';
import 'package:ovolutter/core/translations/localization_controller.dart';
import 'package:ovolutter/data/services/push_notification_service.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/messages.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/model/general_setting/general_setting_response_model.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';

class SplashController extends GetxController {
  GeneralSettingRepo repo;

  SplashController({required this.repo});
  LocalizationController localizationController = LocalizationController();
  bool isLoading = true;
  gotoNextPage() async {
    bool isRemember = SharedPreferenceService.getBool(SharedPreferenceService.rememberMeKey);
    noInternet = false;
    update();
    if (isRemember) {
      PushNotificationService().sendUserToken();
    }
    await loadLanguage();
    await loadAndSaveGeneralSettingsData(isRemember);
  }

  bool noInternet = false;
  loadAndSaveGeneralSettingsData(bool isRemember) async {
    ResponseModel response = await repo.getGeneralSetting();

    if (response.statusCode == 200) {
      GeneralSettingResponseModel model = GeneralSettingResponseModel.fromJson(response.responseJson);
      if (model.status?.toLowerCase() == MyStrings.success) {
        await SharedPreferenceService.setGeneralSettingData(model);
      } else {
        List<String> message = [MyStrings.somethingWentWrong];
        CustomSnackBar.error(errorList: model.message ?? message);
      }
    } else {
      if (response.statusCode == 503) {
        noInternet = true;
        update();
      }
      // CustomSnackBar.error(errorList: [response.message]);
    }

    isLoading = false;
    update();

    if (isRemember) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAndToNamed(RouteHelper.bottomNavBar);
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAndToNamed(RouteHelper.loginScreen);
      });
    }
  }

  Future<void> loadLanguage() async {
    localizationController.loadCurrentLanguage();
    String languageCode = localizationController.locale.languageCode;

    ResponseModel response = await repo.getLanguage(languageCode);
    if (response.statusCode == 200) {
      try {
        Map<String, Map<String, String>> language = {};

        saveLanguageList(jsonEncode(response.responseJson));
        var resJson = (response.responseJson);
        Map value = resJson['data']['file'].toString() == '[]' ? {} : resJson['data']['file'];
        Map<String, String> json = {};
        value.forEach((key, value) {
          json[key] = value.toString();
        });
        language['${localizationController.locale.languageCode}_${localizationController.locale.countryCode}'] = json;
        Get.addTranslations(Messages(languages: language).keys);
      } catch (e) {
        CustomSnackBar.error(errorList: [e.toString()]);
      }
    } else {
      CustomSnackBar.error(errorList: [response.message]);
    }
  }

  void saveLanguageList(String languageJson) async {
    await SharedPreferenceService.setString(SharedPreferenceService.languageListKey, languageJson);
    return;
  }
}
