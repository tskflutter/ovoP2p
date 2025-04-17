import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/custom_drop_down_button_with_text_field.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text/label_text.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/new_advertising/new_advertising_controller.dart';

class SetTypeAndPrice extends StatefulWidget {
  const SetTypeAndPrice({super.key});

  @override
  State<SetTypeAndPrice> createState() => _SetTypeAndPriceState();
}

class _SetTypeAndPriceState extends State<SetTypeAndPrice> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<NewAdvertisingController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyStrings.oneOfThreeSetTyeAndPrice.tr,
            style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
          ),
          spaceDown(Dimensions.space16.h),
          CustomRoundedCard(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.space4.sp),
                decoration: BoxDecoration(color: MyColor.lightCardColor2.withValues(alpha: .7), border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space12)),
                child: TabBar(
                  controller: controller.tabController,
                  onTap: (value) {
                    controller.changeTab();
                  },
                  labelPadding: EdgeInsets.all(0),
                  indicatorColor: MyColor.getTransparentColor(),
                  dividerColor: MyColor.transparent,
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(color: controller.currentTab == 0 ? MyColor.getSuccessColor() : MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                        child: Center(
                          child: Text(
                            MyStrings.buy.tr,
                            style: theme.textTheme.headlineSmall?.copyWith(color: controller.currentTab == 0 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(color: controller.currentTab == 1 ? MyColor.getErrorColor() : MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                        child: Center(
                          child: Text(
                            MyStrings.sell.tr,
                            style: theme.textTheme.headlineSmall?.copyWith(color: controller.currentTab == 1 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: TabBarView(controller: controller.tabController, children: [
                  Tab(
                    child: Column(
                      children: [
                        spaceDown(Dimensions.space20.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelText(
                                    text: MyStrings.asset,
                                    textStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
                                  ),
                                  spaceDown(Dimensions.space4.h),
                                  Container(
                                    decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12)),
                                    child: CustomDropDownWithTextField(
                                      borderWidth: 0,
                                      title: MyStrings.asset.tr,
                                      hasBorder: false,
                                      list: controller.buySellList,
                                      onChanged: (value) {},
                                      selectedValue: controller.buySellList[0],
                                      itemTextStyle: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            spaceSide(Dimensions.space16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelText(
                                    text: MyStrings.paymentMethod.tr,
                                    textStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
                                  ),
                                  spaceDown(Dimensions.space4.h),
                                  Container(
                                    decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12)),
                                    child: CustomDropDownWithTextField(
                                      borderWidth: 0,
                                      title: MyStrings.asset.tr,
                                      hasBorder: false,
                                      list: controller.buySellList,
                                      onChanged: (value) {},
                                      selectedValue: controller.buySellList[0],
                                      itemTextStyle: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Text("data"),
                  ),
                ]),
              )
            ],
          )),
          spaceDown(Dimensions.space16.h),
          CustomRoundedCard(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(
                text: MyStrings.paymentMethod.tr,
                textStyle: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor()),
              ),
              Divider(
                height: Dimensions.space25.h,
                color: MyColor.getBorderColor(),
              ),
              LabelText(
                text: MyStrings.priceType.tr,
                textStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
              ),
              spaceDown(Dimensions.space4.h),
              Container(
                padding: EdgeInsets.all(Dimensions.space4.sp),
                decoration: BoxDecoration(color: MyColor.getBackgroundColor(), border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space12)),
                child: TabBar(
                  controller: controller.tabController,
                  onTap: (value) {
                    controller.changeTab();
                  },
                  labelPadding: EdgeInsets.all(0),
                  indicatorColor: MyColor.getTransparentColor(),
                  dividerColor: MyColor.transparent,
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: controller.currentTab == 0 ? MyColor.getBorderColor() : MyColor.getTransparentColor()), color: controller.currentTab == 0 ? MyColor.getBorderColor() : MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                        child: Center(
                          child: Text(
                            MyStrings.fixed.tr,
                            style: theme.textTheme.headlineSmall?.copyWith(color: controller.currentTab == 0 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: controller.currentTab == 1 ? MyColor.getBorderColor() : MyColor.getTransparentColor()), color: controller.currentTab == 1 ? MyColor.getBorderColor() : MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                        child: Center(
                          child: Text(
                            MyStrings.floating.tr,
                            style: theme.textTheme.headlineSmall?.copyWith(color: controller.currentTab == 1 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .13,
                child: TabBarView(controller: controller.tabController, children: [
                  Tab(
                    child: Column(
                      children: [
                        spaceDown(Dimensions.space20.h),
                        TextFormField(
                          textAlign: TextAlign.center,

                          style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17, color: MyColor.getHeadingTextColor()),
                          cursorColor: MyColor.getBodyTextColor(),
                          // controller: widget.controller,

                          autofocus: false,

                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            prefixIcon: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space8), color: MyColor.getBorderColor()),
                              child: MyAssetImageWidget(
                                assetPath: MyImages.add,
                                isSvg: true,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            suffixIcon: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space8), color: MyColor.getBorderColor()),
                              child: MyAssetImageWidget(
                                assetPath: MyImages.add,
                                isSvg: true,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: Dimensions.space5,
                              horizontal: Dimensions.space5,
                            ),
                            hintText: "0.00",
                            hintStyle: theme.textTheme.titleMedium?.copyWith(color: MyColor.getHeadingTextColor(), fontSize: Dimensions.space17.sp),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.getTransparentColor()),
                            ),
                            focusColor: MyColor.transparent,
                            fillColor: MyColor.getTransparentColor(),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.space12.h),
                              borderSide: BorderSide(color: MyColor.getBorderColor()),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.space12.h),
                              borderSide: BorderSide(color: MyColor.getBorderColor()),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.space12.h),
                              borderSide: BorderSide(color: MyColor.getBorderColor()),
                            ),
                          ),

                          onChanged: (v) {},
                        ),
                        spaceDown(Dimensions.space10.h),
                        Row(
                          children: [
                            LabelText(
                              text: MyStrings.highestOrderPrice.tr,
                              textStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
                            ),
                            LabelText(
                              text: "\$500.00 ",
                              textStyle: theme.textTheme.titleMedium?.copyWith(color: MyColor.getHeadingTextColor(), fontSize: Dimensions.space17.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Text("data"),
                  ),
                ]),
              )
            ],
          )),
          spaceDown(Dimensions.space30.h),
          CustomElevatedBtn(
            text: MyStrings.next.tr,
            onTap: () {
              controller.currentStep++;
              controller.update();
            },
            textStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
          ),
        ],
      ),
    );
  }
}
