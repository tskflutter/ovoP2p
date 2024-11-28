import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/account/profile_controller.dart';
import 'package:ovolutter/data/repo/account/profile_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/screens/edit_profile/widget/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    
    Get.put(ProfileRepo());
    final controller = Get.put(ProfileController(profileRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadProfileInfo();
    });
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          isShowBackBtn: true,
          title: MyStrings.editProfile.tr,
        ),
        body: controller.isLoading
            ? const CustomLoader()
            : Stack(
                children: [
                  Positioned(
                    top: -10,
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      color: MyColor.getPrimaryColor(),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15, top: Dimensions.space20, bottom: Dimensions.space20),
                      child: Column(
                        children: [EditProfileForm()],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
