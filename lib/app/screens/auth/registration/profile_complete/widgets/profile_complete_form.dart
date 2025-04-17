import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/screens/global/widgets/country_bottom_sheet.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/account/profile_complete_controller.dart';
import 'package:ovolutter/data/model/country_model/country_model.dart';
import 'package:ovolutter/environment.dart';

class ProfileCompleteForm extends StatefulWidget {
  const ProfileCompleteForm({super.key});

  @override
  State<ProfileCompleteForm> createState() => _ProfileCompleteFormState();
}

class _ProfileCompleteFormState extends State<ProfileCompleteForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<ProfileCompleteController>(
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(stops: [0.04, 0.4], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [MyColor.lightSecondaryButton, MyColor.lightSecondary]),
                    ),
                    child: CircleAvatar(
                      maxRadius: 16,
                      backgroundColor: MyColor.getTransparentColor(),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.space7.h),
                        child: MyAssetImageWidget(assetPath: MyImages.tik, isSvg: true, boxFit: BoxFit.contain),
                      ),
                    )),
                Expanded(
                  child: Divider(
                    height: 5,
                    color: MyColor.getSecondaryColor(),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(stops: [0.04, 0.4], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [MyColor.lightSecondaryButton, MyColor.lightSecondary]),
                    ),
                    child: CircleAvatar(
                      maxRadius: 16,
                      backgroundColor: MyColor.getTransparentColor(),
                      child: Text("2"),
                    )),
              ],
            ),
            spaceDown(Dimensions.space30.h),
            Container(
              padding: EdgeInsets.all(Dimensions.space16.h),
              decoration: BoxDecoration(
                  color: MyColor.pcBackground,
                  borderRadius: BorderRadius.circular(
                    Dimensions.space20.sp,
                  )),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                    SizedBox(height: Dimensions.space16.h),
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
                                        imageUrl: UrlContainer.countryFlagImageLink.replaceAll("{countryCode}", (controller.countryData?.countryCode ?? Environment.defaultCountryCode).toLowerCase()),
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
                    SizedBox(height: Dimensions.space16.h),
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
                    SizedBox(height: Dimensions.space16.h),
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
                    SizedBox(height: Dimensions.space16.h),
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
                    SizedBox(height: Dimensions.space16.h),
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
                        Get.toNamed(RouteHelper.smsVerificationScreen);
                        // if (formKey.currentState!.validate()) {
                        //   controller.profileCompleteSubmit();
                        // }
                      },
                    ),
                    const SizedBox(height: Dimensions.space30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
