import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/advance_switch/custom_switch.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/market_controller/market_controller.dart';

class MarketFilterDrawer extends StatelessWidget {
  const MarketFilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      width: context.width / 1.3,
      backgroundColor: MyColor.pcBackground,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: MyColor.pcBackground,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.space12.w),
          child: GetBuilder<MarketController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceDown(Dimensions.space20.h),
                Row(
                  children: [
                    MyAssetImageWidget(
                      assetPath: MyImages.roundedCancel,
                      isSvg: true,
                      height: Dimensions.space40.h,
                      width: Dimensions.space40.h,
                    ),
                    spaceSide(Dimensions.space8.w),
                    Text(MyStrings.filters.tr, style: theme.textTheme.headlineMedium?.copyWith(fontSize: Dimensions.space22.sp, color: MyColor.getHeadingTextColor()))
                  ],
                ),
                spaceDown(Dimensions.space20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.saveFilterforNextUse.tr,
                      style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    CustomSwitch(
                        value: controller.saveforNext,
                        onChanged: (v) {
                          controller.changeSaveStatus();
                        })
                  ],
                ),
                spaceDown(Dimensions.space32.h),
                Text(MyStrings.adTypes.tr, style: theme.textTheme.headlineMedium?.copyWith(fontSize: Dimensions.space22.sp, color: MyColor.getHeadingTextColor())),
                spaceDown(Dimensions.space14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.verifiedMerchant.tr,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CustomSwitch(
                        value: controller.verifiedMerchant,
                        onChanged: (v) {
                          controller.changeMerchantStatus();
                        })
                  ],
                ),
                spaceDown(Dimensions.space18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.adswithNoVerification.tr,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CustomSwitch(
                        value: controller.adswithNoVerification,
                        onChanged: (v) {
                          controller.changeAdsStatus();
                        })
                  ],
                ),
                spaceDown(Dimensions.space32.h),
                Text(MyStrings.paymentTimeLimit.tr, style: theme.textTheme.headlineMedium?.copyWith(fontSize: Dimensions.space22.sp, color: MyColor.getHeadingTextColor())),
                spaceDown(Dimensions.space12.h),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.6, mainAxisSpacing: 4, crossAxisSpacing: 4),
                  itemBuilder: (context, index) {
                    return TradeButton(
                      onTap: () {},
                      horizontalPadding: Dimensions.space2,
                      verticalPadding: Dimensions.space10,
                      borderRadious: Dimensions.space8,
                      name: "name",
                      hasBorder: true,
                      color: MyColor.lightCardColor2,
                    );
                  },
                ),
                spaceDown(Dimensions.space32.h),
                Text(MyStrings.countryorRegion.tr, style: theme.textTheme.headlineMedium?.copyWith(fontSize: Dimensions.space22.sp, color: MyColor.getHeadingTextColor())),
                spaceDown(Dimensions.space12.h),
                LabelTextField(
                  fillColor: MyColor.getTransparentColor(),
                  //  controller: controller.emailController,
                  labelText: MyStrings.email.tr,
                  hideLabel: true,
                  hintText: MyStrings.allRegion.tr,
                  onChanged: (value) {},
                  // focusNode: controller.emailFocusNode,
                  // nextFocus: controller.passwordFocusNode,
                  textInputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  onTap: () {},
                  hintTextColor: MyColor.getBodyTextColor(),
                  inputTextStyle: theme.textTheme.labelLarge?.copyWith(color: MyColor.getBodyTextColor()),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MyAssetImageWidget(
                      assetPath: MyImages.globe,
                      isSvg: true,
                      height: 10.h,
                      width: 10.h,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: MyAssetImageWidget(
                      assetPath: MyImages.filledDropDown,
                      isSvg: true,
                      height: 16.h,
                      width: 16.h,
                    ),
                  ),
                  radius: Dimensions.largeRadius,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return MyStrings.fieldErrorMsg.tr;
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              spaceDown(Dimensions.space12.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space16),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: CustomElevatedBtn(text: MyStrings.apply.tr, onTap: () {})),
                    spaceSide(Dimensions.space8.w),
                    Expanded(child: CustomElevatedBtn(textColor: MyColor.getBodyTextColor(), hasGradiant: false, bgColor: MyColor.getBorderColor(), text: MyStrings.reset.tr, onTap: () {})),
                  ],
                ),
              ),
              spaceDown(Dimensions.space32.h)
            ],
          ),
        ),
      )),
    );
  }
}
