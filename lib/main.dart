import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovolutter/core/theme/my_theme.dart';
import 'package:ovolutter/core/translations/localization_controller.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/environment.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/messages.dart';
import 'package:ovolutter/data/services/push_notification_service.dart';
import 'core/di_service/di_services.dart' as di_service;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Stop Landscape
  // MyUtils().stopLandscape();
  // init shared preference
  await SharedPreferenceService.init();
  // inti fcm services
  await PushNotificationService().setupInteractedMessage();
  //Api inits
  ApiService.init();
  //Dependency injection
  await di_service.initDependency();
  HttpOverrides.global = MyHttpOverrides();
  runApp(OvoApp(languages: {}));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

//APP ENTRY POINT
class OvoApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const OvoApp({super.key, required this.languages});

  @override
  State<OvoApp> createState() => _OvoAppState();
}

class _OvoAppState extends State<OvoApp> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size and orientation
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    // Determine the design size based on screen size and orientation
    Size designSize;

    if (size.width > 600) {
      // Tablet-sized devices
      if (orientation == Orientation.landscape) {
        // If the orientation is landscape, you might want to adjust the design size further
        designSize = const Size(1200, 800); // Larger design for tablets in landscape
      } else {
        designSize = const Size(800, 1200); // Larger design for tablets in portrait
      }
    } else {
      // Mobile-sized devices
      if (orientation == Orientation.landscape) {
        // If in landscape mode on mobile devices, use a slightly wider design size
        designSize = const Size(812, 375); // Adjust for landscape mode on mobile
      } else {
        // Default design for portrait mode on mobile
        designSize = const Size(375, 812);
      }
    }

    return ScreenUtilInit(
      // todo add your (Xd / Figma) artboard size
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, w) {
        return ToastificationWrapper(
          child: GetMaterialApp(
            title: Environment.appName,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.noTransition,
            transitionDuration: const Duration(milliseconds: 200),
            initialRoute: RouteHelper.splashScreen,
            // theme: lightThemeData,
            // darkTheme: darkThemeData,
            // themeMode: themeController.darkTheme ? ThemeMode.dark : ThemeMode.light,
            navigatorKey: Get.key,
            getPages: RouteHelper().routes,
            locale: LocalizationController().locale,
            translations: Messages(languages: widget.languages),
            fallbackLocale: Locale(LocalizationController().locale.languageCode, LocalizationController().locale.countryCode),
            builder: (context, widget) {
              bool themeIsLight = SharedPreferenceService.getThemeIsLight();
              return Theme(
                data: MyTheme.getThemeData(isLight: themeIsLight),
                child: MediaQuery(
                  // prevent font from scalling (some people use big/small device fonts)
                  // but we want our app font to still the same and dont get affected
                  data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
                  child: widget!,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
