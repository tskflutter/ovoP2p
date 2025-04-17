import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/custom_drop_down_button_with_text_field.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text/label_text_with_instructions.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/send/send_controller.dart';
import 'package:ovolutter/data/controller/wallet_details/wallet_details_controller.dart';
import 'package:ovolutter/data/repo/deposit_r/deposit_repo.dart';
import 'package:ovolutter/data/repo/send/send_repo.dart';

import '../../../data/controller/deposit_c/deposit_controller.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  void initState() {
    Get.put(SendRepo());
    final controller = Get.put(SendController(sendRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<SendController>(
        builder: (controller) => MyCustomScaffold(
              pageTitle: "Send Ethereum",
              body: SingleChildScrollView(
                child: Column(
                  children: [
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
                              hintText: MyStrings.longPresstoPaste.tr,
                              hintStyle: theme.textTheme.labelLarge?.copyWith(
                                color: MyColor.getBodyTextColor(),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColor.getTransparentColor()),
                              ),
                              focusColor: MyColor.transparent,
                              fillColor: MyColor.lightCardColor2,
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
                                height: 40,
                                width: 40,
                                child: MyAssetImageWidget(
                                  assetPath: MyImages.scan,
                                  isSvg: true,
                                  height: Dimensions.space24.h,
                                  width: Dimensions.space24.h,
                                ),
                              )),

                          onChanged: (v) {},
                        ),
                        spaceDown(Dimensions.space16.h),
                        LabelTextInstruction(
                          text: MyStrings.network.tr,
                          instructions: "model.instruction",
                          textStyle: theme.textTheme.bodySmall?.copyWith(
                            color: MyColor.getBodyTextColor(),
                          ),
                        ),
                        spaceDown(Dimensions.space4.h),
                        Container(
                          decoration: BoxDecoration(color: MyColor.lightCardColor2, borderRadius: BorderRadius.circular(Dimensions.space12)),
                          child: CustomDropDownWithTextField(
                            borderWidth: 1,
                            borderRadious: Dimensions.space12,
                            hasBorder: true,
                            list: controller.buySellList,
                            onChanged: (value) {},
                            selectedValue: controller.buySellList[0],
                            itemTextStyle: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
                          ),
                        ),
                        spaceDown(Dimensions.space16.h),
                        LabelTextInstruction(
                          text: MyStrings.withdrawlAmount.tr,
                          instructions: "model.instruction",
                          textStyle: theme.textTheme.bodySmall?.copyWith(
                            color: MyColor.getBodyTextColor(),
                          ),
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
                              hintText: "Minimum 0.00000050",
                              hintStyle: theme.textTheme.labelLarge?.copyWith(
                                color: MyColor.getBodyTextColor(),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColor.getTransparentColor()),
                              ),
                              focusColor: MyColor.transparent,
                              fillColor: MyColor.lightCardColor2,
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
                                height: 40,
                                width: 40,
                                child: Text("ETH", style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space15, color: MyColor.getHeadingTextColor())),
                              )),

                          onChanged: (v) {},
                        ),
                        spaceDown(Dimensions.space8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              MyStrings.available.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space15.sp),
                            ),
                            Text(
                              "8.47896832 ETH",
                              style: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getHeadingTextColor(), fontSize: Dimensions.space15.sp),
                            ),
                          ],
                        )
                      ],
                    )),
                    spaceDown(Dimensions.space40.h),
                    CustomElevatedBtn(text: MyStrings.saveAndShareAddress.tr, onTap: () {})
                  ],
                ),
              ),
              floatingActionButton: Container(
                height: 150,
                padding: EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space18),
                color: MyColor.pcBackground,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyStrings.receiveAmount.tr,
                            style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                          ),
                          Text(
                            "0.00 ETH",
                            style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space28.sp, color: MyColor.getHeadingTextColor()),
                          ),
                          Row(
                            children: [
                              Text(
                                MyStrings.networkFee.tr,
                                style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                              ),
                              Text(
                                " 0.00 ETH",
                                style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getHeadingTextColor()),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    spaceSide(Dimensions.space50.w),
                    Expanded(child: CustomElevatedBtn(text: MyStrings.withdraw.tr, onTap: () {}))
                  ],
                ),
              ),
            ));
  }
}
