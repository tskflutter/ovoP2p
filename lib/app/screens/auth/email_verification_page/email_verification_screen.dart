import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/text/header_text.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/controller/auth/auth/email_verification_controler.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/data/repo/auth/sms_email_verification_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/text/small_text.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';

import '../../../components/image/custom_svg_picture.dart';
import '../../../components/otp_field_widget/otp_field_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void initState() {
    Get.put(SmsEmailVerificationRepo());
    Get.put(GeneralSettingRepo());
    final controller = Get.put(EmailVerificationController(repo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadData();
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
      child: MyCustomScaffold(
          pageTitle: "",
          body: GetBuilder<EmailVerificationController>(
            builder: (controller) => controller.isLoading
                ? Center(child: CircularProgressIndicator(color: MyColor.getPrimaryColor()))
                : SingleChildScrollView(
                    padding: Dimensions.screenPadding,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: Dimensions.space30),
                          CustomSvgPicture(
                            image: MyImages.emailVerifyImage,
                            height: Dimensions.space100.h,
                            width: Dimensions.space100.w,
                          ),
                          const SizedBox(height: Dimensions.space50),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .07),
                            child: Text(MyStrings.pleaseCheckEmail.tr, textAlign: TextAlign.center, style: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getHeadingTextColor())),
                          ),
                          Text("${MyStrings.viaEmailVerify.tr} aabsdbasbdbdsa@gmail.com", textAlign: TextAlign.center, style: regularDefault.copyWith(color: MyColor.getBodyTextColor())),
                          const SizedBox(height: 30),
                          OTPFieldWidget(
                            onChanged: (value) {
                              controller.currentText = value;
                            },
                          ),
                          const SizedBox(height: Dimensions.space30),
                          CustomElevatedBtn(
                            isLoading: controller.submitLoading,
                            text: MyStrings.verify.tr,
                            onTap: () {
                              Get.toNamed(RouteHelper.bottomNavBar);
                              // controller.verifyEmail(controller.currentText);
                            },
                          ),
                          const SizedBox(height: Dimensions.space30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(MyStrings.didNotReceiveCode.tr, style: regularDefault.copyWith(color: MyColor.getBodyTextColor())),
                              const SizedBox(width: Dimensions.space10),
                              controller.resendLoading
                                  ? Container(margin: const EdgeInsets.only(left: 5, top: 5), height: 20, width: 20, child: CircularProgressIndicator(color: MyColor.getPrimaryColor()))
                                  : GestureDetector(
                                      onTap: () {
                                        controller.sendCodeAgain();
                                      },
                                      child: Text(MyStrings.resendCode.tr, style: regularDefault.copyWith(color: MyColor.getSecondaryColor(), decoration: TextDecoration.underline)),
                                    )
                            ],
                          )
                        ],
                      ),
                    )),
          )),
    );
  }
}
