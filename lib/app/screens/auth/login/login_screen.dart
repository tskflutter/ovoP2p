import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:ovolutter/app/components/image/my_image_widget.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/data/controller/auth/login_controller.dart';
import 'package:ovolutter/data/controller/auth/social_login_controller.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';
import 'package:ovolutter/data/repo/auth/social_login_repo.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/environment.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/my_text_button.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/components/text/default_text.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';
import 'package:ovolutter/app/screens/auth/login/widget/social_login_section.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: GetBuilder<LoginController>(
          builder: (controller) => SingleChildScrollView(
            padding: Dimensions.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .07),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyStrings.loginAccount.tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: Dimensions.space8),
                          Text(
                            MyStrings.loginSubTitle.tr,
                            style: Theme.of(context).textTheme.titleSmall,
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
                              MyImageWidget(
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
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: Dimensions.space30),
                      LabelTextField(
                        controller: controller.emailController,
                        labelText: MyStrings.usernameOrEmail.tr,
                        // hintText: MyStrings.enterEmailOrUserName,
                        onChanged: (value) {},
                        focusNode: controller.emailFocusNode,
                        nextFocus: controller.passwordFocusNode,
                        textInputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        radius: Dimensions.largeRadius,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return MyStrings.fieldErrorMsg.tr;
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: MyColor.getAccent1Color().withOpacity(0.5),
                          size: Dimensions.inputIconSize + 2,
                        ),
                      ),
                      const SizedBox(height: Dimensions.space20),
                      LabelTextField(
                        labelText: MyStrings.password.tr,
                        // hintText: MyStrings.enterYourPassword_,
                        controller: controller.passwordController,
                        focusNode: controller.passwordFocusNode,
                        onChanged: (value) {},
                        isPassword: true,
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
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: MyColor.getAccent1Color().withOpacity(0.5),
                          size: Dimensions.inputIconSize + 2,
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
                              child: DefaultText(text: MyStrings.forgotPassword.tr, textColor: MyColor.getPrimaryColor()),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomElevatedBtn(
                        isLoading: controller.isSubmitLoading,
                        text: MyStrings.signIn.tr,
                        press: () {
                          if (formKey.currentState!.validate()) {
                            controller.loginUser();
                          }
                        },
                        height: 55,
                        radius: Dimensions.largeRadius,
                      ),
                      const SocialLoginSection(),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(MyStrings.doNotHaveAccount.tr, overflow: TextOverflow.ellipsis, style: regularDefault.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w500)),
                          const SizedBox(width: Dimensions.space5),
                          CustomTextButton(
                            press: () {
                              Get.offAndToNamed(RouteHelper.registrationScreen);
                            },
                            text: MyStrings.signUP.tr,
                            style: regularLarge.copyWith(color: MyColor.getPrimaryColor(), fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
