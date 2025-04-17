import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/account/change_password_controller.dart';
import 'package:ovolutter/data/repo/account/change_password_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/screens/account/change-password/widget/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  void initState() {
    Get.put(ChangePasswordRepo());
    Get.put(ChangePasswordController(changePasswordRepo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ChangePasswordController>().clearData();
    });
  }

  @override
  void dispose() {
    Get.find<ChangePasswordController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MyCustomScaffold(
      pageTitle: MyStrings.changePassword.tr,
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) => SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space20), border: Border.all(color: MyColor.getBorderColor())),
            padding: EdgeInsets.symmetric(vertical: Dimensions.space20.h, horizontal: Dimensions.space15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const ChangePasswordForm()],
            ),
          ),
        ),
      ),
    );
  }
}
