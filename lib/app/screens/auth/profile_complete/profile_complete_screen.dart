import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/app/screens/global/widgets/country_bottom_sheet.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/account/profile_complete_controller.dart';
import 'package:ovolutter/data/model/country_model/country_model.dart';
import 'package:ovolutter/data/repo/account/profile_repo.dart';
import 'package:ovolutter/data/services/push_notification_service.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';
import 'package:get/get.dart';
import 'package:ovolutter/environment.dart';
import '../../../../core/utils/url_container.dart';

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
    Get.put(PushNotificationService());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return WillPopWidget(
      nextRoute: '',
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: MyStrings.profileComplete.tr,
          isShowBackBtn: true,
          fromAuth: false,
          isProfileCompleted: true,
          bgColor: theme.appBarTheme.backgroundColor,
        ),
        body: GetBuilder<ProfileCompleteController>(
          builder: (controller) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: Dimensions.screenPadding,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.space15),
                  LabelTextField(
                    isRequired: true,
                    labelText: MyStrings.username.tr,
                    hintText: "",
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    focusNode: controller.usernameFocusNode,
                    controller: controller.usernameController,
                    nextFocus: controller.mobileNoFocusNode,
                    validator: (value) {
                      if ((value as String).trim().isEmpty) {
                        return MyStrings.kUsernameIsRequired.tr;
                      } else if (value.length < 6) {
                        return MyStrings.kShortUserNameError.tr;
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: Dimensions.space25),
                  LabelTextField(
                    onChanged: (v) {},
                    labelText: (MyStrings.phoneNo).replaceAll('.', '').tr,
                    // hintText: MyStrings.enterYourPhoneNumber,
                    controller: controller.mobileNoController,
                    focusNode: controller.mobileNoFocusNode,
                    textInputType: TextInputType.phone,
                    inputAction: TextInputAction.next,
                    prefixIcon: SizedBox(
                      width: 100,
                      child: FittedBox(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                CountryBottomSheet.countryBottomSheet(context, onSelectedData: (Countries data) {
                                  controller.selectACountry(countryDataValue: data);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space12),
                                decoration: BoxDecoration(
                                  color: MyColor.getTransparentColor(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    MyNetworkImageWidget(
                                      imageUrl:  UrlContainer.countryFlagImageLink.replaceAll("{countryCode}", (controller.countryData?.countryCode ?? Environment.defaultCountryCode).toLowerCase()),
                                      height: Dimensions.space25,
                                      width: Dimensions.space40 + 2,
                                    ),
                                    const SizedBox(width: Dimensions.space5),
                                    Text(controller.countryData?.countryCode ?? ''),
                                    const SizedBox(width: Dimensions.space3),
                                    Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: MyColor.getAccent1Color(),
                                    ),
                                    Container(
                                      width: 2,
                                      height: Dimensions.space12,
                                      color: MyColor.getBorderColor(),
                                    ),
                                    const SizedBox(width: Dimensions.space8)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    validator: (value) {
                      if ((value as String).trim().isEmpty) {
                        return MyStrings.kPhoneNumberIsRequired.tr;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: Dimensions.space25),
                  LabelTextField(
                    labelText: MyStrings.address,
                    hintText: "",
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    focusNode: controller.addressFocusNode,
                    controller: controller.addressController,
                    nextFocus: controller.stateFocusNode,
                    // validator: (value) {
                    //   if ((value as String).trim().isEmpty) {
                    //     return MyStrings.fieldErrorMsg.tr;
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  const SizedBox(height: Dimensions.space25),
                  LabelTextField(
                    labelText: MyStrings.state,
                    hintText: "",
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    focusNode: controller.stateFocusNode,
                    controller: controller.stateController,
                    nextFocus: controller.cityFocusNode,
                    // validator: (value) {
                    //   if ((value as String).trim().isEmpty) {
                    //     return MyStrings.fieldErrorMsg.tr;
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  const SizedBox(height: Dimensions.space25),
                  LabelTextField(
                    labelText: MyStrings.city.tr,
                    hintText: "",
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    focusNode: controller.cityFocusNode,
                    controller: controller.cityController,
                    nextFocus: controller.zipCodeFocusNode,
                    // validator: (value) {
                    //   if ((value as String).trim().isEmpty) {
                    //     return MyStrings.fieldErrorMsg.tr;
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  const SizedBox(height: Dimensions.space25),
                  LabelTextField(
                    labelText: MyStrings.zipCode.tr,
                    hintText: "",
                    textInputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    focusNode: controller.zipCodeFocusNode,
                    controller: controller.zipCodeController,
                    // validator: (value) {
                    //   if ((value as String).trim().isEmpty) {
                    //     return MyStrings.fieldErrorMsg.tr;
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  const SizedBox(height: Dimensions.space35),
                  CustomElevatedBtn(
                    isLoading: controller.submitLoading,
                    text: MyStrings.updateProfile.tr,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.profileCompleteSubmit();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
