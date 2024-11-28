import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/controller/auth/forget_password/verify_password_controller.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/image/custom_svg_picture.dart';
import 'package:ovolutter/app/components/text/default_text.dart';

class VerifyForgetPassScreen extends StatefulWidget {
  const VerifyForgetPassScreen({super.key});

  @override
  State<VerifyForgetPassScreen> createState() => _VerifyForgetPassScreenState();
}

class _VerifyForgetPassScreenState extends State<VerifyForgetPassScreen> {
  @override
  void initState() {
    Get.put(LoginRepo());
    final controller = Get.put(VerifyPasswordController(loginRepo: Get.find()));

    controller.email = Get.arguments;

    super.initState();
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          fromAuth: true,
          isShowBackBtn: true,
          bgColor: theme.appBarTheme.backgroundColor,
          title: MyStrings.passVerification.tr,
        ),
        body: GetBuilder<VerifyPasswordController>(
            builder: (controller) => controller.isLoading
                ? Center(child: CircularProgressIndicator(color: MyColor.getPrimaryColor()))
                : SingleChildScrollView(
                    padding: Dimensions.screenPadding,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: Dimensions.space50),
                          Container(height: 100, width: 100, alignment: Alignment.center, decoration: BoxDecoration(color: MyColor.getPrimaryColor().withOpacity(.07), shape: BoxShape.circle), child: CustomSvgPicture(image: MyImages.emailVerifyImage, height: 50, width: 50, color: MyColor.getPrimaryColor())),
                          const SizedBox(height: Dimensions.space25),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 25), child: DefaultText(text: '${MyStrings.verifyPasswordSubText.tr} : ${controller.getFormatedMail().tr}', textAlign: TextAlign.center, textColor: MyColor.getBodyTextColor())),
                          const SizedBox(height: Dimensions.space40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                              length: 6,
                              textStyle: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                              obscureText: false,
                              obscuringCharacter: '*',
                              blinkWhenObscuring: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderWidth: 1,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 40,
                                  fieldWidth: 40,
                                  inactiveColor: MyColor.getBorderColor(),
                                  inactiveFillColor: MyColor.getScaffoldBackgroundColor(),
                                  activeFillColor: MyColor.getScaffoldBackgroundColor(),
                                  activeColor: MyColor.getPrimaryColor(),
                                  selectedFillColor: MyColor.getScaffoldBackgroundColor(),
                                  selectedColor: MyColor.getPrimaryColor()),
                              cursorColor: MyColor.getBodyTextColor(),
                              animationDuration: const Duration(milliseconds: 100),
                              enableActiveFill: true,
                              keyboardType: TextInputType.number,
                              beforeTextPaste: (text) {
                                return true;
                              },
                              onChanged: (value) {
                                setState(() {
                                  controller.currentText = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: Dimensions.space25),
                          CustomElevatedBtn(
                            isLoading: controller.verifyLoading,
                            onTap: () {
                              if (controller.currentText.length != 6) {
                                controller.hasError = true;
                              } else {
                                controller.verifyForgetPasswordCode(controller.currentText);
                              }
                            },
                            text: MyStrings.submit.tr,
                          ),
                          const SizedBox(height: Dimensions.space25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultText(text: MyStrings.didNotReceiveCode.tr, textColor: MyColor.getBodyTextColor()),
                              const SizedBox(width: Dimensions.space5),
                              controller.isResendLoading
                                  ? SizedBox(
                                      height: 17,
                                      width: 17,
                                      child: CircularProgressIndicator(
                                        color: MyColor.getPrimaryColor(),
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () {
                                        controller.resendForgetPassCode();
                                      },
                                      child: DefaultText(text: MyStrings.resend.tr, textStyle: regularDefault.copyWith(color: MyColor.getPrimaryColor())),
                                    )
                            ],
                          )
                        ],
                      ),
                    ))));
  }
}
