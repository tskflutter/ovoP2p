import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/environment.dart';

class GreetingAndLanguageSection extends StatelessWidget {
  const GreetingAndLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: Dimensions.screenPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.welcomeBack.tr,
                  style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.space35),
                ),
                const SizedBox(height: Dimensions.space8),
                Text(
                  MyStrings.loginSubTitle.tr,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space17.sp),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.languageScreen);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: MyColor.getBorderColor(), width: 1),
                borderRadius: BorderRadius.circular(4),
                boxShadow: MyUtils.getCardShadow(),
              ),
              child: Row(
                children: [
                  if (SharedPreferenceService.getString(SharedPreferenceService.languageImagePath, defaultValue: "") == "")
                    Icon(
                      Icons.g_translate,
                      color: MyColor.getPrimaryColor(),
                    )
                  else
                    MyNetworkImageWidget(
                      imageUrl: SharedPreferenceService.getString(SharedPreferenceService.languageImagePath, defaultValue: ''),
                      width: 20,
                      height: 20,
                    ),
                  const SizedBox(
                    width: Dimensions.space2 + 1,
                  ),
                  Text(
                    SharedPreferenceService.getString(SharedPreferenceService.languageCode, defaultValue: Environment.defaultLangCode.toUpperCase()).toUpperCase(),
                    style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
