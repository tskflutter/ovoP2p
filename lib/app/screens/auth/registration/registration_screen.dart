import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/annotated_region/annotated_region_widget.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/my_text_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/screens/auth/registration/widget/greeting_section.dart';
import 'package:ovolutter/app/screens/auth/registration/widget/social_registration_section.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/auth/auth/registration_controller.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/data/repo/auth/signup_repo.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    Get.put(GeneralSettingRepo());
    Get.put(RegistrationRepo());
    Get.put(RegistrationController(registrationRepo: Get.find(), generalSettingRepo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<RegistrationController>().initData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: GetBuilder<RegistrationController>(
        builder: (controller) => Stack(children: [
          MyAssetImageWidget(boxFit: BoxFit.fitWidth, width: double.infinity, height: context.height, assetPath: MyImages.loginBg),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                GreetingSection(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.space12),
                        border: Border.all(color: MyColor.getBorderColor()),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SocialRegistrationSection(),
                          LabelTextField(
                            isglassFillColor: true,
                            controller: controller.emailController,
                            labelText: MyStrings.email.tr,
                            hintText: MyStrings.usernameOrEmailHint.tr,
                            onChanged: (value) {},
                            focusNode: controller.emailFocusNode,
                            nextFocus: controller.passwordFocusNode,
                            textInputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            radius: Dimensions.largeRadius,
                            onTap: () {
                              _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                            },
                            prefixIcon: Container(
                              margin: EdgeInsets.symmetric(horizontal: Dimensions.space5.w),
                              padding: EdgeInsets.all(Dimensions.space12),
                              decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  border: Border.all(
                                    color: MyColor.getBorderColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.space8.h,
                                  )),
                              child: MyAssetImageWidget(
                                assetPath: MyImages.email,
                                boxFit: BoxFit.contain,
                                isSvg: true,
                                height: Dimensions.space20.h,
                                width: Dimensions.space20.h,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return MyStrings.fieldErrorMsg.tr;
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: Dimensions.space32.h),
                          CustomElevatedBtn(
                            isLoading: false,
                            text: MyStrings.continues.tr,
                            onTap: () {
                              Get.toNamed(RouteHelper.accountCreation);
                            },
                            height: Dimensions.space55,
                            radius: Dimensions.largeRadius,
                          ),
                          SizedBox(height: Dimensions.space35.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(MyStrings.alreadyAccount.tr, overflow: TextOverflow.ellipsis, style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w500)),
                              const SizedBox(width: Dimensions.space5),
                              CustomTextButton(
                                onTap: () {
                                  Get.offAllNamed(RouteHelper.loginScreen);
                                },
                                text: MyStrings.login.tr,
                                style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getSecondaryColor(), fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.space200.h),
                        ],
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
