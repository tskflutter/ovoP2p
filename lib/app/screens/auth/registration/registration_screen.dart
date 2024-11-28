import 'package:flutter/material.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/controller/auth/auth/registration_controller.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/data/repo/auth/signup_repo.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/buttons/my_text_button.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/custom_no_data_found_class.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';
import 'package:ovolutter/app/screens/auth/login/widget/social_login_section.dart';
import 'package:ovolutter/app/screens/auth/registration/widget/registration_form.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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
    return GetBuilder<RegistrationController>(
      builder: (controller) => WillPopWidget(
        nextRoute: RouteHelper.loginScreen,
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: const CustomAppBar(title: MyStrings.signUp, fromAuth: true),
          body: controller.noInternet ?
          NoDataOrInternetScreen(
            isNoInternet: true,
            onChanged: (value) {
              controller.changeInternet(value);
            },
          ) : controller.isLoading ?
          const CustomLoader() :
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space30, horizontal: Dimensions.space15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                Text(
                  MyStrings.signUP.tr,
                  style: boldMediumLarge.copyWith(),
                ),
                const SizedBox(height: Dimensions.space8),
                Text(
                  MyStrings.startLearntingWithCreateAccount.tr,
                  style: lightDefault.copyWith(
                    color: MyColor.getBodyTextColor(),
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .03),
                const RegistrationForm(),
                const SocialLoginSection(),
                const SizedBox(height: Dimensions.space30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MyStrings.alreadyAccount.tr, style: regularLarge.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w500)),
                    const SizedBox(width: Dimensions.space5),
                    CustomTextButton(
                      press: () {
                        controller.clearAllData();
                        Get.offAndToNamed(RouteHelper.loginScreen);
                      },
                      text: MyStrings.signIn.tr,
                      style: regularLarge.copyWith(color: MyColor.getPrimaryColor()),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
