import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/screens/auth/registration/widget/validation_widget.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/controller/auth/forget_password/reset_password_controller.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';
import 'package:ovolutter/app/components/text/default_text.dart';
import 'package:ovolutter/app/components/text/header_text.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(LoginRepo());
    final controller = Get.put(ResetPasswordController(loginRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.email = Get.arguments[0];
      controller.code = Get.arguments[1];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return WillPopWidget(
      nextRoute: RouteHelper.loginScreen,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(title: MyStrings.resetPassword.tr, fromAuth: true, bgColor: theme.appBarTheme.backgroundColor),
        body: GetBuilder<ResetPasswordController>(
          builder: (controller) => SingleChildScrollView(
            padding: Dimensions.screenPadding,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimensions.space30),
                  HeaderText(text: MyStrings.resetPassword.tr),
                  const SizedBox(height: Dimensions.space15),
                  DefaultText(text: MyStrings.resetPassContent.tr, textStyle: regularDefault.copyWith(color: MyColor.getBodyTextColor().withOpacity(0.8))),
                  const SizedBox(height: Dimensions.space15),
                  Focus(
                    onFocusChange: (hasFocus) {
                      controller.changePasswordFocus(hasFocus);
                    },
                    child: LabelTextField(
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      focusNode: controller.passwordFocusNode,
                      nextFocus: controller.confirmPasswordFocusNode,
                      hintText: MyStrings.enterNewPassword,
                      labelText: MyStrings.password,
                      isPassword: true,
                      textInputType: TextInputType.text,
                      controller: controller.passController,
                      validator: (value) {
                        return controller.validatePassword(value);
                      },
                      onChanged: (value) {
                        if (controller.checkPasswordStrength) {
                          controller.updateValidationList(value);
                        }
                        return;
                      },
                      prefixIcon: Icon(
                        Icons.lock,
                        color: MyColor.getAccent1Color(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.hasPasswordFocus && controller.checkPasswordStrength,
                    child: ValidationWidget(
                      list: controller.passwordValidationRules,
                      fromReset: true,
                    ),
                  ),
                  const SizedBox(height: Dimensions.space15),
                  LabelTextField(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    inputAction: TextInputAction.done,
                    isPassword: true,
                    labelText: MyStrings.confirmPassword.tr,
                    controller: controller.confirmPassController,
                    hintText: MyStrings.enterConfirmPassword,
                    onChanged: (value) {
                      return;
                    },
                    validator: (value) {
                      if (controller.passController.text.toLowerCase() != controller.confirmPassController.text.toLowerCase()) {
                        return MyStrings.kMatchPassError.tr;
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.lock,
                      color: MyColor.getAccent1Color(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.space35),
                  CustomElevatedBtn(
                    isLoading: controller.submitLoading,
                    text: MyStrings.submit.tr,
                    press: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPassword();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
