import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/gradiant_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text/label_text_with_instructions.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/new_advertising/new_advertising_controller.dart';

import '../../../../core/utils/util_exporter.dart';

class SetTotalAmountAndPaymentMethod extends StatefulWidget {
  const SetTotalAmountAndPaymentMethod({super.key});

  @override
  State<SetTotalAmountAndPaymentMethod> createState() => _SetTotalAmountAndPaymentMethodState();
}

class _SetTotalAmountAndPaymentMethodState extends State<SetTotalAmountAndPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<NewAdvertisingController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyStrings.twoOfThreeSetTotalAmountAndPaymentMethod.tr,
            style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
          ),
          spaceDown(Dimensions.space10.h),
          CustomRoundedCard(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyStrings.totalAmount.tr,
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
              ),
              spaceDown(Dimensions.space4.h),
              TextFormField(
                style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17, color: MyColor.getHeadingTextColor()),
                cursorColor: MyColor.getBodyTextColor(),
                // controller: widget.controller,

                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: Dimensions.space10,
                      horizontal: Dimensions.space15,
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
                    suffixIcon: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      child: Text(
                        "ETH",
                        style: theme.textTheme.headlineSmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                      ),
                    )),

                onChanged: (v) {},
              ),
              spaceDown(Dimensions.space8.h),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "In Usd",
                      style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space4.w),
                      child: MyAssetImageWidget(
                        assetPath: MyImages.arrowForward,
                        isSvg: true,
                        height: Dimensions.space16.w,
                        width: Dimensions.space16.w,
                      ),
                    ),
                    Text(
                      "\$122222.45",
                      style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
                    ),
                  ],
                ),
              ),
              spaceDown(Dimensions.space16.h),
              LabelTextInstruction(
                text: MyStrings.orderLimit.tr,
                isRequired: false,
                instructions: "model.instruction",
                textStyle: theme.textTheme.labelSmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
              ),
              spaceDown(Dimensions.space4.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17, color: MyColor.getHeadingTextColor()),
                      cursorColor: MyColor.getBodyTextColor(),
                      // controller: widget.controller,

                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: Dimensions.space10,
                            horizontal: Dimensions.space15,
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
                          suffixIcon: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            child: Text(
                              "ETH",
                              style: theme.textTheme.headlineSmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                            ),
                          )),

                      onChanged: (v) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space5),
                    child: MyAssetImageWidget(
                      assetPath: MyImages.equal,
                      isSvg: true,
                      height: Dimensions.space15.h,
                      width: Dimensions.space12.h,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17, color: MyColor.getHeadingTextColor()),
                      cursorColor: MyColor.getBodyTextColor(),
                      // controller: widget.controller,

                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: Dimensions.space10,
                            horizontal: Dimensions.space15,
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
                          suffixIcon: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            child: Text(
                              "ETH",
                              style: theme.textTheme.headlineSmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                            ),
                          )),

                      onChanged: (v) {},
                    ),
                  ),
                ],
              ),
            ],
          )),
          spaceDown(Dimensions.space12.h),
          CustomRoundedCard(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyStrings.priceSettings.tr,
                          style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
                        ),
                        spaceDown(Dimensions.space4.h),
                        Text(
                          MyStrings.selectUpto3Methods.tr,
                          style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor()),
                        ),
                      ],
                    ),
                  ),
                  GradientAddButton(
                    onPressed: () {},
                  ),
                ],
              ),
              spaceDown(Dimensions.space8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: Dimensions.space10.h,
                      runSpacing: Dimensions.space10.w,
                      children: List.generate(controller.data.length, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: Dimensions.space5.h, horizontal: Dimensions.space10.h),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), border: Border.all(color: MyColor.getBorderColor())),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Dimensions.space12.h,
                                width: Dimensions.space2.w,
                                color: MyColor.getSuccessColor(),
                              ),
                              spaceSide(Dimensions.space2.w),
                              Text(controller.data[index].toString()),
                              spaceSide(Dimensions.space8.w),
                              MyAssetImageWidget(
                                assetPath: MyImages.roundedCancel,
                                isSvg: true,
                                height: Dimensions.space16.h,
                                width: Dimensions.space16.h,
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Divider(
                color: MyColor.getBorderColor(),
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelTextInstruction(
                      text: MyStrings.paymentTimeLimits.tr,
                      isRequired: false,
                      instructions: "model.instruction",
                      textStyle: theme.textTheme.labelSmall?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getHeadingTextColor()),
                    ),
                  ),
                  Text(
                    "15 min",
                    style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getHeadingTextColor()),
                  ),
                  MyAssetImageWidget(
                    assetPath: MyImages.arrowforwardIos,
                    isSvg: true,
                    height: Dimensions.space16.h,
                    width: Dimensions.space16.h,
                    color: MyColor.getBodyTextColor(),
                  )
                ],
              ),
            ],
          )),
          spaceDown(Dimensions.space50.h),
          Row(
            children: [
              Expanded(
                child: CustomElevatedBtn(
                  bgColor: MyColor.getHeadingTextColor().withValues(alpha: .25),
                  hasGradiant: false,
                  textColor: MyColor.getBodyTextColor(),
                  text: MyStrings.previous.tr,
                  onTap: () {
                    controller.currentStep--;
                    controller.update();
                  },
                  textStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getBodyTextColor()),
                ),
              ),
              spaceSide(Dimensions.space10.w),
              Expanded(
                flex: 2,
                child: CustomElevatedBtn(
                  text: MyStrings.next.tr,
                  onTap: () {
                    controller.currentStep++;
                    controller.update();
                  },
                  textStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
