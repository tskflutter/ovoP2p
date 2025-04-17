import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/advance_switch/custom_switch.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/custom_drop_down_button_with_text_field.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/advertising/widget/amount_details_row.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/advertising/advertising_controller.dart';
import 'package:ovolutter/data/controller/my_withdrawals/my_withdrawals_controller.dart';
import 'package:ovolutter/data/repo/advertising/advertising_repo.dart';
import 'package:ovolutter/data/repo/my_withdrawals/my_withdrawals_repo.dart';

class AdvertisingScreen extends StatefulWidget {
  const AdvertisingScreen({super.key});

  @override
  State<AdvertisingScreen> createState() => _AdvertisingScreenState();
}

class _AdvertisingScreenState extends State<AdvertisingScreen> {
  @override
  void initState() {
    Get.put(AdvertisingRepo());
    final controller = Get.put(AdvertisementController(advertisingRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<AdvertisementController>(
        builder: (controller) => MyCustomScaffold(
            pageTitle: MyStrings.advertising.tr,
            actionButton: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.newAdvertisingScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(Dimensions.space2),
                  decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: MyColor.cardGradiant)),
                  child: Icon(
                    Icons.add,
                    size: Dimensions.space20.h,
                    color: MyColor.white,
                  ),
                ),
              ),
              spaceSide(Dimensions.space8.w),
              MyAssetImageWidget(
                assetPath: MyImages.remain,
                isSvg: true,
                height: Dimensions.space24.h,
                width: Dimensions.space24.h,
              ),
              spaceSide(Dimensions.space15.w),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12)),
                          child: CustomDropDownWithTextField(
                            borderWidth: 0,
                            hasBorder: false,
                            list: controller.buySellList,
                            onChanged: (value) {},
                            selectedValue: controller.buySellList[0],
                            itemTextStyle: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                      spaceSide(Dimensions.space15.w),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12)),
                          child: CustomDropDownWithTextField(
                            borderWidth: 0,
                            hasBorder: false,
                            list: controller.buySellList,
                            onChanged: (value) {},
                            selectedValue: controller.buySellList[0],
                            itemTextStyle: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                      spaceSide(Dimensions.space15.w),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12)),
                          child: CustomDropDownWithTextField(
                            borderWidth: 0,
                            hasBorder: false,
                            list: controller.buySellList,
                            onChanged: (value) {},
                            selectedValue: controller.buySellList[0],
                            itemTextStyle: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  spaceDown(Dimensions.space25.h),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: Dimensions.space15.h),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CustomRoundedCard(
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
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: Dimensions.space5.w, horizontal: Dimensions.space10.h),
                                decoration: BoxDecoration(color: MyColor.getSuccessColor().withValues(alpha: .3), borderRadius: BorderRadius.circular(Dimensions.space4)),
                                child: Text(MyStrings.online.tr, style: theme.textTheme.headlineSmall?.copyWith(fontSize: Dimensions.space11.sp, color: MyColor.getSuccessColor())),
                              ),
                              spaceSide(Dimensions.space5.w),
                              CustomSwitch(
                                  value: controller.active,
                                  onChanged: (v) {
                                    controller.changeVisiblityStatus(index);
                                  })
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
                  )
                ],
              ),
            )));
  }
}
