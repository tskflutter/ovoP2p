import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/controller/auth/forget_password/forget_password_controller.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/buttons/rounded_button.dart';
import 'package:ovolutter/app/components/buttons/rounded_loading_button.dart';
import 'package:ovolutter/app/components/text-field/custom_text_field.dart';
import 'package:ovolutter/app/components/text/default_text.dart';
import 'package:ovolutter/app/components/text/header_text.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(LoginRepo());
    Get.put(ForgetPasswordController(loginRepo: Get.find()));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          fromAuth: true,
          isShowBackBtn: true,
          title: MyStrings.forgetPassword.tr,
          bgColor: theme.appBarTheme.backgroundColor,
        ),
        body: GetBuilder<ForgetPasswordController>(
          builder: (auth) => SingleChildScrollView(
            padding: Dimensions.screenPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.space30),
                  HeaderText(text: MyStrings.recoverAccount.tr),
                  const SizedBox(height: 15),
                  DefaultText(text: MyStrings.forgetPasswordSubText.tr, textStyle: regularDefault.copyWith(color: MyColor.getBodyTextColor().withOpacity(0.8))),
                  const SizedBox(height: Dimensions.space40),
                  LabelTextField(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    labelText: MyStrings.usernameOrEmail.tr,
                    // hintText: MyStrings.usernameOrEmailHint.tr,
                    textInputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    controller: auth.emailOrUsernameController,
                    onChanged: (value) {
                      return;
                    },
                    validator: (value) {
                      if (auth.emailOrUsernameController.text.isEmpty) {
                        return MyStrings.enterEmailOrUserName.tr;
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      color: MyColor.getAccent1Color(),
                      size: Dimensions.inputIconSize + 2,
                    ),
                  ),
                  const SizedBox(height: Dimensions.space25),
                  CustomElevatedBtn(
                    isLoading: auth.submitLoading,
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        auth.submitForgetPassCode();
                      }
                    },
                    text: MyStrings.submit.tr,
                  ),
                  const SizedBox(height: Dimensions.space40)
                ],
              ),
            ),
          ),
        ));
  }
}
