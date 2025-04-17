import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/annotated_region/annotated_region_widget.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/my_text_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/components/text/default_text.dart';
import 'package:ovolutter/app/screens/auth/login/widget/greeting_and_language_section.dart';
import 'package:ovolutter/app/screens/auth/login/widget/social_login_section.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/auth/login_controller.dart';
import 'package:ovolutter/data/controller/auth/social_login_controller.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';
import 'package:ovolutter/data/repo/auth/social_login_repo.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/environment.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    Get.put(LoginRepo());
    Get.put(LoginController(loginRepo: Get.find()));
    Get.put(SocialLoginRepo());
    Get.put(SocialLoginController(repo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LoginController>().remember = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AnnotatedRegionWidget(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: MyColor.transparent,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        body: GetBuilder<LoginController>(
          builder: (controller) => Stack(children: [
            MyAssetImageWidget(
              assetPath: MyImages.loginBg,
              boxFit: BoxFit.fitWidth,
              width: double.infinity,
              height: context.height,
            ),
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .04),
                  GreetingAndLanguageSection(),
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SocialLoginSection(),
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
                                onTap: () {
                                  _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                                },
                                radius: Dimensions.largeRadius,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return MyStrings.fieldErrorMsg.tr;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: Dimensions.space20),
                              LabelTextField(
                                isglassFillColor: true,
                                labelText: MyStrings.password.tr,
                                hintText: MyStrings.enterYourPassword_,
                                controller: controller.passwordController,
                                focusNode: controller.passwordFocusNode,
                                onChanged: (value) {},
                                textInputType: TextInputType.text,
                                inputAction: TextInputAction.done,
                                radius: Dimensions.largeRadius,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return MyStrings.fieldErrorMsg.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MyAssetImageWidget(
                                    assetPath: MyImages.faceV,
                                    height: Dimensions.space40.h,
                                    width: Dimensions.space40.h,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              GestureDetector(
                                onTap: () {
                                  controller.changeRememberMe();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                                            overlayColor: WidgetStatePropertyAll(MyColor.getPrimaryColor()),
                                            splashRadius: 4,
                                            activeColor: MyColor.getPrimaryColor(),
                                            checkColor: MyColor.white,
                                            value: controller.remember,
                                            side: WidgetStateBorderSide.resolveWith(
                                              (states) => BorderSide(
                                                width: 1.0,
                                                color: controller.remember ? MyColor.getBorderColor() : MyColor.getBorderColor(),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              controller.changeRememberMe();
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        DefaultText(text: MyStrings.rememberMe.tr, textColor: MyColor.getBodyTextColor())
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.clearTextField();
                                        Get.toNamed(RouteHelper.forgotPasswordScreen);
                                      },
                                      child: DefaultText(text: MyStrings.forgotPassword.tr, textColor: MyColor.getErrorColor()),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              CustomElevatedBtn(
                                isLoading: controller.isSubmitLoading,
                                text: MyStrings.login.tr,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.loginUser();
                                  }
                                },
                                height: Dimensions.space55,
                                radius: Dimensions.largeRadius,
                              ),
                              SizedBox(height: Dimensions.space35.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(MyStrings.doNotHaveAccount.tr, overflow: TextOverflow.ellipsis, style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w500)),
                                  const SizedBox(width: Dimensions.space5),
                                  CustomTextButton(
                                    onTap: () {
                                      Get.offAndToNamed(RouteHelper.registrationScreen);
                                    },
                                    text: MyStrings.register.tr,
                                    style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getSecondaryColor(), fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(height: Dimensions.space200.h),
                            ],
                          ),
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
