import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/screens/auth/registration/widget/validation_widget.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/auth/auth/account_creation_controller.dart';

class FirstStep extends StatefulWidget {
  const FirstStep({super.key});

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<AccountCreationController>(
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(stops: [0.04, 0.4], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [MyColor.lightSecondaryButton, MyColor.lightSecondary]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.space12.h),
                      child: Center(child: Text("1", style: theme.textTheme.headlineMedium?.copyWith(color: MyColor.white))),
                    )),
                Expanded(
                  child: Divider(
                    height: 5,
                    color: MyColor.getBorderColor(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColor.getBorderColor()),
                    shape: BoxShape.circle,
                    color: MyColor.getTransparentColor(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.space12.h),
                    child: Center(child: Text("2", style: theme.textTheme.headlineMedium?.copyWith(color: MyColor.getBodyTextColor()))),
                  ),
                )
              ],
            ),
            spaceDown(Dimensions.space30.h),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(
                    color: MyColor.getBorderColor(),
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimensions.space12.h,
                  )),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(Dimensions.space5.w),
                    padding: EdgeInsets.all(Dimensions.space12.h),
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
                      height: Dimensions.space24.h,
                      width: Dimensions.space24.h,
                    ),
                  ),
                  spaceSide(Dimensions.space10.w),
                  Expanded(
                    child: Text(
                      "Abassadsadasd@gmail.com",
                      style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400, color: MyColor.getHeadingTextColor()),
                    ),
                  ),
                  MyAssetImageWidget(
                    assetPath: MyImages.greenTik,
                    isSvg: true,
                    height: Dimensions.space24.h,
                    width: Dimensions.space24.h,
                  ),
                  spaceSide(Dimensions.space12.w)
                ],
              ),
            ),
            spaceDown(Dimensions.space30.h),
            Container(
              padding: EdgeInsets.all(Dimensions.space16.h),
              decoration: BoxDecoration(
                  color: MyColor.pcBackground,
                  borderRadius: BorderRadius.circular(
                    Dimensions.space20.sp,
                  )),
              child: Column(
                children: [
                  LabelTextField(
                    labelText: MyStrings.firstName.tr,
                    hintText: "",
                    controller: controller.fNameController,
                    focusNode: controller.firstNameFocusNode,
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return MyStrings.enterYourFirstName.tr;
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  SizedBox(height: Dimensions.space16.h),
                  LabelTextField(
                    labelText: MyStrings.lastName.tr,
                    hintText: "",
                    controller: controller.lNameController,
                    focusNode: controller.lastNameFocusNode,
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return MyStrings.enterYourLastName.tr;
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  SizedBox(height: Dimensions.space16.h),
                  Focus(
                    onFocusChange: (hasFocus) {
                      controller.changePasswordFocus(hasFocus);
                    },
                    child: LabelTextField(
                      isPassword: true,
                      labelText: MyStrings.password.tr,
                      // hintText: MyStrings.enterYourPassword_,
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocusNode,
                      nextFocus: controller.confirmPasswordFocusNode,
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        if (controller.checkPasswordStrength) {
                          controller.updateValidationList(value);
                        }
                      },
                      validator: (value) {
                        return controller.validatePassword(value ?? '');
                      },
                      labelTextStyle: boldDefault.copyWith(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.textToTextSpace),
                  Visibility(
                    visible: controller.hasPasswordFocus && controller.checkPasswordStrength,
                    child: ValidationWidget(
                      list: controller.passwordValidationRules,
                    ),
                  ),
                  const SizedBox(height: Dimensions.space10),
                  LabelTextField(
                    labelText: MyStrings.confirmPassword.tr,
                    // hintText: MyStrings.confirmYourPassword,
                    controller: controller.cPasswordController,
                    focusNode: controller.confirmPasswordFocusNode,
                    inputAction: TextInputAction.done,
                    isPassword: true,
                    onChanged: (value) {},
                    validator: (value) {
                      if (controller.passwordController.text.toLowerCase() != controller.cPasswordController.text.toLowerCase()) {
                        return MyStrings.kMatchPassError.tr;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: Dimensions.space16.h),
                  Visibility(
                      visible: controller.needAgree,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                              activeColor: MyColor.getPrimaryColor(),
                              checkColor: MyColor.white,
                              value: true,
                              side: WidgetStateBorderSide.resolveWith(
                                (states) => BorderSide(width: 1.0, color: controller.agreeTC ? MyColor.getBorderColor() : MyColor.getBorderColor()),
                              ),
                              onChanged: (bool? value) {
                                //  controller.updateAgreeTC();
                              },
                            ),
                          ),
                          const SizedBox(width: Dimensions.space8),
                          Row(
                            children: [
                              Text(MyStrings.iAgreeWith.tr, style: regularDefault.copyWith(color: MyColor.getBodyTextColor())),
                              const SizedBox(width: Dimensions.space3),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteHelper.privacyScreen);
                                },
                                child: Text(MyStrings.policies.tr.toLowerCase(), style: regularDefault.copyWith(color: MyColor.getPrimaryColor(), decoration: TextDecoration.underline, decorationColor: MyColor.getPrimaryColor())),
                              ),
                              const SizedBox(width: Dimensions.space3),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(height: Dimensions.space30),
                  CustomElevatedBtn(
                      text: MyStrings.confirm.tr,
                      onTap: () {
                        Get.offAndToNamed(RouteHelper.profileCompleteScreen);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
