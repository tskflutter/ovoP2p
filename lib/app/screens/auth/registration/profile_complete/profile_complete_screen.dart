import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/screens/auth/registration/profile_complete/widgets/profile_complete_form.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/account/profile_complete_controller.dart';
import 'package:ovolutter/data/repo/account/profile_repo.dart';
import 'package:ovolutter/data/repo/auth/profile_complete_repo.dart';

class ProfileCompleteScreen extends StatefulWidget {
  const ProfileCompleteScreen({super.key});

  @override
  State<ProfileCompleteScreen> createState() => _ProfileCompleteScreenState();
}

class _ProfileCompleteScreenState extends State<ProfileCompleteScreen> {
  @override
  void initState() {
    Get.put(ProfileRepo());
    Get.put(ProfileCompleteController(profileRepo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get.find<RegistrationController>().initData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MyCustomScaffold(
      pageTitle: MyStrings.accountCreation.tr,
      body: GetBuilder<ProfileCompleteController>(
        builder: (controller) => ProfileCompleteForm(),
      ),
    );
  }
}
