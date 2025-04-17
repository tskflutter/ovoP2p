import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/annotated_region/annotated_region_widget.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/stepper/custom_stepper.dart';
import 'package:ovolutter/app/screens/auth/registration/account_creation/widgets/first_step.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/auth/auth/account_creation_controller.dart';
import 'package:ovolutter/data/repo/auth/account_creation_repo.dart';

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  State<AccountCreationScreen> createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  @override
  void initState() {
    Get.put(AccountCreationRepo());
    Get.put(AccountCreationController(accountCreationRepo: Get.find()));

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
      body: GetBuilder<AccountCreationController>(
        builder: (controller) => FirstStep(),
      ),
    );
  }
}
