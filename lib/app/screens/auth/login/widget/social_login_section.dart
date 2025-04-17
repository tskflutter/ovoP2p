import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/buttons/custom_outlined_button.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/auth/social_login_controller.dart';
import 'package:ovolutter/data/repo/auth/social_login_repo.dart';
import 'package:get/get.dart';

class SocialLoginSection extends StatefulWidget {
  const SocialLoginSection({super.key});

  @override
  State<SocialLoginSection> createState() => _SocialLoginSectionState();
}

class _SocialLoginSectionState extends State<SocialLoginSection> {
  @override
  void initState() {
    Get.put(SocialLoginRepo());
    Get.put(SocialLoginController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<SocialLoginController>(builder: (controller) {
      return Visibility(
        visible: controller.checkSocialAuthActiveOrNot(provider: 'all'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.space35.h),
            Row(
              children: [
                if (controller.checkSocialAuthActiveOrNot(provider: 'google')) ...[
                  SizedBox(width: Dimensions.space15.h),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space35, vertical: Dimensions.space12),
                      decoration: BoxDecoration(
                          color: MyColor.getTransparentColor(),
                          border: Border.all(
                            color: MyColor.getBorderColor(),
                          ),
                          borderRadius: BorderRadius.circular(Dimensions.space12.h)),
                      child: Image.asset(
                        MyImages.google,
                        fit: BoxFit.contain,
                        height: Dimensions.space32.h,
                        width: Dimensions.space32.h,
                      ),
                    ),
                  ),
                ],
                if (controller.checkSocialAuthActiveOrNot(provider: 'linkedin')) ...[
                  SizedBox(width: Dimensions.space15.h),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space35, vertical: Dimensions.space12),
                      decoration: BoxDecoration(
                          color: MyColor.getTransparentColor(),
                          border: Border.all(
                            color: MyColor.getBorderColor(),
                          ),
                          borderRadius: BorderRadius.circular(Dimensions.space12.h)),
                      child: Image.asset(
                        MyImages.linkedin,
                        fit: BoxFit.contain,
                        height: Dimensions.space32.h,
                        width: Dimensions.space30.h,
                      ),
                    ),
                  ),
                ],
                if (controller.checkSocialAuthActiveOrNot(provider: 'facebook')) ...[
                  SizedBox(width: Dimensions.space15.h),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space35, vertical: Dimensions.space12),
                      decoration: BoxDecoration(
                          color: MyColor.getTransparentColor(),
                          border: Border.all(
                            color: MyColor.getBorderColor(),
                          ),
                          borderRadius: BorderRadius.circular(Dimensions.space12.h)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.space5.h),
                        child: Image.asset(
                          MyImages.facebook,
                          fit: BoxFit.contain,
                          height: Dimensions.space32.h,
                          width: Dimensions.space30.h,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: Dimensions.space100),
                Expanded(
                    flex: 2,
                    child: CustomDivider(
                      color: MyColor.getBodyTextColor(),
                      thickness: 1.5,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                  child: Text(
                    MyStrings.orLoginWith.tr,
                    style: lightDefault.copyWith(color: MyColor.getBodyTextColor()),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: CustomDivider(
                      color: MyColor.getBodyTextColor(),
                      thickness: 1.5,
                    )),
                SizedBox(width: Dimensions.space100),
              ],
            ),
          ],
        ),
      );
    });
  }
}
