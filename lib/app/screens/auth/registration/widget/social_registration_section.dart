import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/auth/social_login_controller.dart';
import 'package:ovolutter/data/repo/auth/social_login_repo.dart';

class SocialRegistrationSection extends StatefulWidget {
  const SocialRegistrationSection({super.key});

  @override
  State<SocialRegistrationSection> createState() => _SocialRegistrationSectionState();
}

class _SocialRegistrationSectionState extends State<SocialRegistrationSection> {
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
            Column(
              children: [
                if (controller.checkSocialAuthActiveOrNot(provider: 'google')) ...[
                  SizedBox(height: Dimensions.space16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(Dimensions.space5),
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: MyColor.getBorderColor(),
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.space12.h)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(Dimensions.space12),
                          decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              border: Border.all(
                                color: MyColor.getBorderColor(),
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.space8.h,
                              )),
                          child: Image.asset(
                            MyImages.google,
                            fit: BoxFit.contain,
                            height: Dimensions.space20.h,
                            width: Dimensions.space20.h,
                          ),
                        ),
                        spaceSide(Dimensions.space16.w),
                        Text(MyStrings.continuewithGoogle.tr, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.space17.sp, color: MyColor.white))
                      ],
                    ),
                  ),
                ],
                if (controller.checkSocialAuthActiveOrNot(provider: 'linkedin')) ...[
                  SizedBox(height: Dimensions.space16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(Dimensions.space5),
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: MyColor.getBorderColor(),
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.space12.h)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(Dimensions.space12),
                          decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              border: Border.all(
                                color: MyColor.getBorderColor(),
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.space8.h,
                              )),
                          child: Image.asset(
                            MyImages.linkedin,
                            fit: BoxFit.contain,
                            height: Dimensions.space20.h,
                            width: Dimensions.space20.h,
                          ),
                        ),
                        spaceSide(Dimensions.space16.w),
                        Text(MyStrings.continuewithLinkedin.tr, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.space17.sp, color: MyColor.white))
                      ],
                    ),
                  ),
                ],
                if (controller.checkSocialAuthActiveOrNot(provider: 'facebook')) ...[
                  SizedBox(height: Dimensions.space16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(Dimensions.space5),
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: MyColor.getBorderColor(),
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.space12.h)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(Dimensions.space12),
                          decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              border: Border.all(
                                color: MyColor.getBorderColor(),
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.space8.h,
                              )),
                          child: Image.asset(
                            MyImages.facebook,
                            fit: BoxFit.contain,
                            height: Dimensions.space20.h,
                            width: Dimensions.space20.h,
                          ),
                        ),
                        spaceSide(Dimensions.space16.w),
                        Text(MyStrings.continuewithFacebook.tr, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.space17.sp, color: MyColor.white))
                      ],
                    ),
                  ),
                ],
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: Dimensions.space50),
                Expanded(
                    flex: 2,
                    child: CustomDivider(
                      color: MyColor.getBodyTextColor(),
                      thickness: 1.5,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                  child: Text(
                    MyStrings.orRegisterWith.tr,
                    style: lightDefault.copyWith(color: MyColor.getBodyTextColor()),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: CustomDivider(
                      color: MyColor.getBodyTextColor(),
                      thickness: 1.5,
                    )),
                SizedBox(width: Dimensions.space50),
              ],
            ),
          ],
        ),
      );
    });
  }
}
