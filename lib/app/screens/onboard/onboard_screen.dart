import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/text/gradiant_text.dart';
import 'package:ovolutter/app/screens/onboard/widget/onboard_body.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/theme/my_fonts.dart';
import 'package:ovolutter/core/theme/my_styles.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
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
      ThemeData theme = Theme.of(context);
      return Scaffold(
        backgroundColor: MyColor.getBackgroundColor(),
        body: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller.controller,
          itemCount: controller.appBanners.length,
          onPageChanged: (i) {
            controller.setCurrentIndex(i);
          },
          itemBuilder: (_, index) {
            return Stack(
              children: [
                OnBoardRippleBody(data: controller.appBanners[index], controller: controller),
                Positioned(
                  bottom: 120,
                  right: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                        child: Text(
                          controller.appBanners[index].title,
                          style: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getHeadingTextColor(), fontSize: 28, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: Dimensions.space20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                        child: Text(
                          controller.appBanners[index].subtitle,
                          style: regularDefault.copyWith(color: MyColor.getBodyTextColor(), fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: Dimensions.defaultPaddingHV,
                        child: DotsIndicator(
                          dotsCount: controller.appBanners.length,
                          position: double.tryParse(controller.currentIndex.toString()) ?? 0.0,
                          mainAxisSize: MainAxisSize.min,
                          decorator: DotsDecorator(
                            activeSize: Size(Dimensions.space35.w, Dimensions.space10.h),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            size: const Size.square(8),
                            activeColor: MyColor.white,
                            color: MyColor.lightBorder,
                          ),
                        ),
                      ),
                      controller.currentIndex == 2
                          ? CustomElevatedBtn(
                              text: MyStrings.getStarted.tr,
                              onTap: () {
                                Get.toNamed(RouteHelper.loginScreen);
                              })
                          : CustomElevatedBtn(
                              text: MyStrings.next.tr,
                              onTap: () {
                                controller.setCurrentIndex(controller.currentIndex + 1);
                              }),
                      spaceDown(Dimensions.space20.h),
                      controller.currentIndex == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MyStrings.alreadyAccount.tr,
                                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400, color: MyColor.getBodyTextColor()),
                                ),
                                spaceSide(Dimensions.space5.w),
                                Text(
                                  MyStrings.login.tr,
                                  style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getSecondaryColor()),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.offAllNamed(RouteHelper.loginScreen);
                              },
                              child: GradientText(
                                MyStrings.skip.tr,
                                style: theme.textTheme.headlineSmall,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
