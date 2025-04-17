import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/screens/profile/widget/user_data_section.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/app_style.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/account/profile_controller.dart';
import 'package:ovolutter/app/components/circle_button_with_icon.dart';
import 'package:ovolutter/app/components/column_widget/card_column.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/app/components/image/circle_shape_image.dart';

class ProfileTopSection extends StatefulWidget {
  const ProfileTopSection({super.key});

  @override
  State<ProfileTopSection> createState() => _ProfileTopSectionState();
}

class _ProfileTopSectionState extends State<ProfileTopSection> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<ProfileController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(20), border: Border.all(color: MyColor.getBorderColor())),
        child: Column(
          children: [
            UserDataSection(
              title: MyStrings.username.tr,
              subTitle: "John_doe007",
            ),
            spaceDown(Dimensions.space12.h),
            UserDataSection(
              title: MyStrings.email.tr,
              subTitle: "johndoe@mail.com",
            ),
            spaceDown(Dimensions.space12.h),
            UserDataSection(
              title: MyStrings.country.tr,
              subTitle: "United States",
            ),
            spaceDown(Dimensions.space12.h),
            UserDataSection(
              title: MyStrings.address.tr,
              subTitle: "2464 Royal Ln. Mesa,  New Jersey",
            ),
            spaceDown(Dimensions.space12.h),
            UserDataSection(
              title: MyStrings.state.tr,
              subTitle: "California",
            ),
            spaceDown(Dimensions.space12.h),
            UserDataSection(
              title: MyStrings.zipCode.tr,
              subTitle: "90740",
            ),
            spaceDown(Dimensions.space12.h),
            UserDataSection(
              title: MyStrings.city.tr,
              subTitle: "Long Beach",
            ),
          ],
        ),
      ),
    );
  }
}
