// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ovolutter/data/services/shared_pref_service.dart';
// import 'package:ovolutter/data/model/language/language_model.dart';

// class LocalizationController extends GetxController {
//   LocalizationController() {
//     loadCurrentLanguage();
//   }

//   static List<MyLanguageModel> myLanguages = [
//     MyLanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),
//     MyLanguageModel(languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
//   ];
//   Locale _locale = Locale(myLanguages[0].languageCode, myLanguages[0].countryCode);

//   bool _isLtr = true;
//   final List<MyLanguageModel> _languages = [];

//   Locale get locale => _locale;
//   bool get isLtr => _isLtr;
//   List<MyLanguageModel> get languages => _languages;

//   void setLanguage(Locale locale, String? imageUrl) {
//     Get.updateLocale(locale);
//     _locale = locale;
//     if (_locale.languageCode == 'ar') {
//       _isLtr = false;
//     } else {
//       _isLtr = true;
//     }
//     saveLanguage(_locale, imageUrl);
//     update();
//   }

//   void loadCurrentLanguage() async {
//     _locale = Locale(SharedPreferenceService.getString(SharedPreferenceService.languageCode, defaultValue: myLanguages[0].languageCode), SharedPreferenceService.getString(SharedPreferenceService.countryCode, defaultValue: myLanguages[0].countryCode));
//     _isLtr = _locale.languageCode != 'ar';
//     update();
//   }

//   void saveLanguage(Locale locale, String? imageUrl) async {
//     SharedPreferenceService.setString(SharedPreferenceService.languageCode, locale.languageCode);
//     SharedPreferenceService.setString(SharedPreferenceService.countryCode, locale.countryCode ?? '');
//     SharedPreferenceService.setString(SharedPreferenceService.languageImagePath, imageUrl ?? '');
//   }

//   int _selectedIndex = 0;
//   int get selectedIndex => _selectedIndex;

//   void setSelectIndex(int index) {
//     _selectedIndex = index;
//     update();
//   }
// }
