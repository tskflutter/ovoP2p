import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/user_data.dart';
import 'package:ovolutter/app/screens/profile/widget/profile_top_section.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/account/profile_controller.dart';
import 'package:ovolutter/data/repo/account/profile_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<ProfileController>(
      builder: (controller) => MyCustomScaffold(
        pageTitle: MyStrings.myProfile.tr,
        body: controller.isLoading
            ? const CustomLoader()
            : Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15, top: Dimensions.space20, bottom: Dimensions.space20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(Dimensions.space16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space20), border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground),
                        child: Row(
                          children: [
                            Expanded(child: UserBio(name: "John Doe", email: "john_doe@gmail.com")),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.editProfileScreen);
                              },
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: MyColor.getPrimaryColor()), borderRadius: BorderRadius.circular(Dimensions.space12), color: MyColor.getPrimaryColor().withValues(alpha: .3)),
                                padding: EdgeInsets.symmetric(vertical: Dimensions.space7, horizontal: Dimensions.space20),
                                child: Center(
                                  child: Text(MyStrings.editProfile.tr,
                                      style: theme.textTheme.titleSmall?.copyWith(
                                        color: MyColor.getPrimaryColor(),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space12.h),
                      ProfileTopSection(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
