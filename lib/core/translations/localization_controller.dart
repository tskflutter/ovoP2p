import 'package:flutter/material.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/data/model/language/language_model.dart';

class LocalizationController {
  // Singleton instance
  static final LocalizationController _instance = LocalizationController._internal();

  factory LocalizationController() {
    return _instance;
  }

  LocalizationController._internal() {
    loadCurrentLanguage();
  }

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    // todo add your English font families (add to assets/fonts, pubspec and name it here) default is poppins for english and cairo for arabic
    'en': const TextStyle(fontFamily: 'AlbertSans'),
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  static List<MyLanguageModel> myLanguages = [
    MyLanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),
    MyLanguageModel(languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];

  Locale _locale = Locale(myLanguages[0].languageCode, myLanguages[0].countryCode);
  bool _isLtr = true;
  final List<MyLanguageModel> _languages = [];

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<MyLanguageModel> get languages => _languages;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setLanguage(Locale locale, String? imageUrl) {
    _locale = locale;
    _isLtr = _locale.languageCode != 'ar';
    saveLanguage(_locale, imageUrl);
    // Call a method here to notify necessary parts of the app
  }

  void loadCurrentLanguage() {
    _locale = Locale(
      SharedPreferenceService.getString(
        SharedPreferenceService.languageCode,
        defaultValue: myLanguages[0].languageCode,
      ),
      SharedPreferenceService.getString(
        SharedPreferenceService.countryCode,
        defaultValue: myLanguages[0].countryCode,
      ),
    );
    _isLtr = _locale.languageCode != 'ar';
  }

  void saveLanguage(Locale locale, String? imageUrl) {
    SharedPreferenceService.setString(
      SharedPreferenceService.languageCode,
      locale.languageCode,
    );
    SharedPreferenceService.setString(
      SharedPreferenceService.countryCode,
      locale.countryCode ?? '',
    );
    SharedPreferenceService.setString(
      SharedPreferenceService.languageImagePath,
      imageUrl ?? '',
    );
  }

  void setSelectIndex(int index) {
    _selectedIndex = index;
    // Call a method here to notify necessary parts of the app
  }
}
