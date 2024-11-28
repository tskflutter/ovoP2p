import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovolutter/app/screens/onboard/widget/onboard_body.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/data/controller/onboard/onboard_controller.dart';
import 'package:ovolutter/app/screens/onboard/widget/onboard_ripple_body.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    Get.put(OnBoardController());
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<OnBoardController>(builder: (controller) {
      return currentIndex == 0
          ? Scaffold(
        backgroundColor: MyColor.white,
        body: Padding(
          padding: Dimensions.screenPadding,
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              Expanded(
                flex: 1,
                child: PageView.builder(
                  controller: controller.controller,
                  itemCount: controller.appBanners.length,
                  onPageChanged: (i) {
                    controller.setCurrentIndex(i);
                  },
                  itemBuilder: (_, index) {
                    return OnBoardBody(
                      data: controller.appBanners[index],
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.currentIndex == controller.appBanners.length
                      ? const SizedBox.shrink()
                      : Text(
                    "Skip",
                    style: regularDefault.copyWith(fontSize: 18),
                  ),
                  DotsIndicator(
                    dotsCount: controller.appBanners.length,
                    position: controller.currentIndex,
                    mainAxisSize: MainAxisSize.min,
                    decorator: DotsDecorator(
                      size: const Size.square(8),
                      activeColor: MyColor.getPrimaryColor(),
                      color: MyColor.getPrimaryColor().withOpacity(0.2),
                    ),
                  ),
                  controller.currentIndex == controller.appBanners.length - 1
                      ? Text(
                    "Done",
                    style: boldDefault.copyWith(fontSize: 18),
                  )
                      : Text(
                    "Next",
                    style: boldDefault.copyWith(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
        ),
      )
          : AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(statusBarColor: MyColor.getTransparentColor(), statusBarIconBrightness: Brightness.light, systemNavigationBarColor: MyColor.getTransparentColor(), systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: PageView.builder(
            controller: controller.controller,
            itemCount: controller.appBanners.length,
            onPageChanged: (i) {
              controller.setCurrentIndex(i);
            },
            itemBuilder: (_, index) {
              return Stack(
                children: [
                  OnBoardRippleBody(data: controller.appBanners[index], controller: controller),
                  Positioned.fill(
                    bottom: height * 0.01,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: Dimensions.defaultPaddingHV,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DotsIndicator(
                              dotsCount: controller.appBanners.length,
                              position: controller.currentIndex,
                              mainAxisSize: MainAxisSize.min,
                              decorator: DotsDecorator(
                                size: const Size.square(8),
                                activeColor: MyColor.white,
                                color: MyColor.white.withOpacity(0.5),
                              ),
                            ),
                            controller.currentIndex == controller.appBanners.length - 1
                                ? InkWell(
                              onTap: () {
                                // Go to Next Page
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  boxShadow: MyUtils.getCardShadow(),
                                  shape: BoxShape.circle,
                                  color: Colors.white24,
                                ),
                                child: Icon(
                                  Icons.place,
                                  color: controller.appBanners[index].bgcolor!,
                                ),
                              ),
                            )
                                : InkWell(
                              onTap: () {
                                controller.setCurrentIndex(controller.currentIndex + 1);
                                controller.controller?.nextPage(duration: const Duration(microseconds: 500), curve: Curves.decelerate);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  boxShadow: MyUtils.getCardShadow(),
                                  shape: BoxShape.circle,
                                  color: Colors.white24,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: controller.appBanners[index].bgcolor!,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}