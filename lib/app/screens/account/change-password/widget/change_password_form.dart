import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/rounded_text_field.dart';
import 'package:ovolutter/app/screens/account/change-password/widget/validation_indicator_section.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/account/change_password_controller.dart';
import 'package:ovolutter/app/components/text-field/custom_text_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<ChangePasswordController>(
        builder: (controller) => Form(
              key: formKey,
              child: Column(
                children: [
                  RoundedTextField(
                    labelText: MyStrings.currentPassword.tr,
                    labelFillColor: MyColor.pcBackground,
                    hintText: "",
                    fillColor: MyColor.getTransparentColor(),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return MyStrings.enterCurrentPass.tr;
                      } else {
                        return null;
                      }
                    },
                    controller: controller.currentPassController,
                  ),
                  const SizedBox(height: Dimensions.space20),
                  RoundedTextField(
                    labelText: MyStrings.newPassword.tr,
                    labelFillColor: MyColor.pcBackground,
                    hintText: "",
                    fillColor: MyColor.getTransparentColor(),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.passValidation = true;
                      } else {
                        controller.passValidation = false;
                      }
                      controller.upperCase = RegExp(r'[A-Z]').hasMatch(value);
                      controller.lowerCase = RegExp(r'[a-z]').hasMatch(value);
                      controller.number = RegExp(r'[0-9]').hasMatch(value);
                      controller.specialCharacter = RegExp(r'[!@#\$%^&*()<>?/|}{~:]').hasMatch(value);
                      controller.update(); // Triggers UI update (if using GetX or similar)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    controller: controller.passController,
                  ),
                  const SizedBox(height: Dimensions.space20),
                  RoundedTextField(
                    labelText: MyStrings.confirmPassword.tr,
                    hintText: "",
                    labelFillColor: MyColor.pcBackground,
                    fillColor: MyColor.getTransparentColor(),
                    validator: (value) {
                      if (controller.confirmPassController.text != controller.passController.text) {
                        return MyStrings.kMatchPassError.tr;
                      } else {
                        return null;
                      }
                    },
                    controller: controller.confirmPassController,
                  ),
                  const SizedBox(height: Dimensions.space20),
                  Visibility(
                      visible: controller.passValidation,
                      child: Column(
                        children: [
                          ValidationIndicatorSection(title: MyStrings.upperCase, isDone: controller.upperCase),
                          spaceDown(Dimensions.space8.h),
                          ValidationIndicatorSection(title: MyStrings.lowerCase, isDone: controller.lowerCase),
                          spaceDown(Dimensions.space8.h),
                          ValidationIndicatorSection(title: MyStrings.number, isDone: controller.number),
                          spaceDown(Dimensions.space8.h),
                          ValidationIndicatorSection(title: MyStrings.specialCharacter, isDone: controller.specialCharacter),
                        ],
                      )),
                  const SizedBox(height: Dimensions.space35),
                  CustomElevatedBtn(
                      text: MyStrings.saveChanges.tr,
                      isLoading: controller.submitLoading,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.changePassword();
                        }
                      })
                ],
              ),
            ));
  }
}
