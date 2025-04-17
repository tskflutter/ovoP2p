class Environment {
  static const appName = "OVOLUTTER";
  static const appVersion = "1.0.0";

  static String defaultLangCode = "en";
  static String defaultLanguageName = "English";

  static String defaultPhoneCode = "1"; //don't put + here
  static String defaultCountryCode = "US";

  static const int animationDuration = 375;

  //DEV MODE ==> false if production
  static const bool DEV_MODE = true;

  // API END POINT URL
  static const MAIN_API_URL = DEV_MODE ? TEST_API_URL : LIVE_API_URL; // Don't touch here

  static const LIVE_API_URL = 'http://192.168.30.163/flutter/admin_panel'; //Live end Point URL

  // static const TEST_API_URL =  'http://192.168.30.163/flutter/ovo_panel'; //Local or demo or test URL
  static const TEST_API_URL = 'http://192.168.120.3/flutter/ovo_panel'; //Local or demo or test URL

  // API END POINT URL END
}
