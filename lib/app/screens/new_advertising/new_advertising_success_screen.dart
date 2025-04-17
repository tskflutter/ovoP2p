import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/divider/dashed_divider.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/advertising/widget/amount_details_row.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/new_advertising/new_advertising_controller.dart';

class NewAdvertisingSuccessScreen extends StatefulWidget {
  const NewAdvertisingSuccessScreen({super.key});

  @override
  State<NewAdvertisingSuccessScreen> createState() => _NewAdvertisingSuccessScreenState();
}

class _NewAdvertisingSuccessScreenState extends State<NewAdvertisingSuccessScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<NewAdvertisingController>(
        builder: (controller) => MyCustomScaffold(
            showAppBar: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                spaceDown(Dimensions.space100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyAssetImageWidget(
                      assetPath: MyImages.greenTik,
                      isSvg: true,
                      height: Dimensions.space24.h,
                      width: Dimensions.space24.h,
                    ),
                    spaceSide(Dimensions.space8.w),
                    Text(
                      MyStrings.postP2pAdSuccessful.tr,
                      style: theme.textTheme.titleLarge?.copyWith(color: MyColor.getSuccessColor()),
                    ),
                  ],
                ),
                spaceDown(Dimensions.space8.h),
                Text(
                  MyStrings.postP2pAdSuccessfulSubText.tr,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space15.sp),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: DotWidget(
                      emptyWidth: 10,
                      totalWidth: context.width,
                      dashColor: MyColor.getBorderColor(),
                      dashHeight: 1.5,
                      dashWidth: 4,
                    )),
                spaceDown(Dimensions.space8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.adNumber.tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space15.sp),
                    ),
                    Text(
                      "565465465165465465",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getHeadingTextColor(), fontSize: Dimensions.space15.sp),
                    ),
                  ],
                ),
                spaceDown(Dimensions.space12.h),
                CustomRoundedCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            MyStrings.buy.tr,
                            style: theme.textTheme.bodyLarge?.copyWith(color: MyColor.getSuccessColor()),
                          ),
                          spaceSide(Dimensions.space5.w),
                          Text(
                            "ETH",
                            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getHeadingTextColor()),
                          ),
                          spaceSide(Dimensions.space5.w),
                          Text(
                            MyStrings.withs.tr,
                            style: theme.textTheme.bodyLarge?.copyWith(color: MyColor.getBodyTextColor()),
                          ),
                          spaceSide(Dimensions.space5.w),
                          Text(
                            "USD",
                            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getHeadingTextColor()),
                          ),
                        ],
                      ),
                      spaceDown(Dimensions.space12.h),
                      Row(
                        children: [
                          Text(
                            "\$",
                            style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getHeadingTextColor()),
                          ),
                          Text(
                            "3,6786.02",
                            style: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getHeadingTextColor()),
                          ),
                        ],
                      ),
                      spaceDown(Dimensions.space12.h),
                      AmountDetailsRow(title: MyStrings.amount.tr, value: "1200 ETH"),
                      spaceDown(Dimensions.space4.h),
                      AmountDetailsRow(title: MyStrings.limit.tr, value: "12,000.00 - 50,000.00 USD"),
                      Divider(
                        height: Dimensions.space20,
                        color: MyColor.getBorderColor(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: Dimensions.space10.h,
                              runSpacing: Dimensions.space10.w,
                              children: List.generate(controller.data.length, (index) {
                                return Row(
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
                                  ],
                                );
                              }),
                            ),
                          ),
                          MyAssetImageWidget(
                            assetPath: MyImages.more,
                            isSvg: true,
                            height: Dimensions.space24.h,
                            width: Dimensions.space24.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                spaceDown(Dimensions.space40.h),
                CustomElevatedBtn(text: MyStrings.done.tr, onTap: () {})
              ],
            )));
  }
}
