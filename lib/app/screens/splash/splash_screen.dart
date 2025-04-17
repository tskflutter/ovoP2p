import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

import 'package:ovolutter/data/controller/splash/splash_controller.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    MyUtils.splashScreen();

    Get.put(GeneralSettingRepo());
    final controller = Get.put(SplashController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.gotoNextPage();
    });
  }

  @override
  void dispose() {
    MyUtils.allScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) => Scaffold(
          // backgroundColor: controller.noInternet ? MyColor.white : MyColor.getPrimaryColor(),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: MyAssetImageWidget(
                  height: context.height,
                  width: context.width,
                  boxFit: BoxFit.cover,
                  assetPath: MyImages.splashBgImage,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: MyAssetImageWidget(
                  isSvg: true,
                  height: Dimensions.space40.h,
                  width: Dimensions.space200.w,
                  assetPath: MyImages.appLogo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
