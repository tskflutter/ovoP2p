import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/buttons/custom_outlined_button.dart';
import 'package:ovolutter/data/controller/auth/social_login_controller.dart';
import 'package:ovolutter/data/repo/auth/social_login_repo.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/my_images.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../../core/utils/style.dart';

class SocialRegSection extends StatefulWidget {
  const SocialRegSection({super.key});

  @override
  State<SocialRegSection> createState() => _SocialRegSectionState();
}

class _SocialRegSectionState extends State<SocialRegSection> {
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
            const SizedBox(height: 25),
            Center(
              child: Text(
                MyStrings.or.tr,
                style: lightDefault.copyWith(color: MyColor.getBodyTextColor()),
              ),
            ),
            if (controller.checkSocialAuthActiveOrNot(provider: 'google')) ...[
              const SizedBox(height: 15),
              CustomOutlinedBtn(
                btnText: MyStrings.signInWithGoogle.tr,
                onTap: () {
                  controller.signInWithGoogle();
                },
                isLoading: controller.isGoogleSignInLoading,
                textColor: MyColor.getBodyTextColor(),
                radius: 24,
                height: 55,
                icon: Image.asset(
                  MyImages.google,
                  height: 22,
                  width: 22,
                ),
              ),
            ],
            if (controller.checkSocialAuthActiveOrNot(provider: 'linkedin')) ...[
              const SizedBox(height: 15),
              CustomOutlinedBtn(
                btnText: MyStrings.signInWithLinkedin.tr,
                onTap: () {
                  controller.signInWithLinkedin(context);
                },
                isLoading: controller.isLinkedinLoading,
                textColor: MyColor.getBodyTextColor(),
                radius: 24,
                height: 55,
                icon: Image.asset(
                  MyImages.linkedin,
                  height: 22,
                  width: 22,
                ),
              ),
            ],
            if (controller.checkSocialAuthActiveOrNot(provider: 'facebook')) ...[
              const SizedBox(height: 15),
              CustomOutlinedBtn(
                btnText: MyStrings.signInWithFacebook.tr,
                onTap: () {},
                textColor: MyColor.getBodyTextColor(),
                radius: 24,
                height: 55,
                icon: Image.asset(
                  MyImages.facebook,
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ],
        ),
      );
    });
  }
}
