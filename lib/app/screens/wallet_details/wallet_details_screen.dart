import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/custom_text_field.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/wallet_details/wallet_details_controller.dart';
import 'package:ovolutter/data/repo/wallet_details/wallet_details_repo.dart';

class WalletDetailsScreen extends StatefulWidget {
  const WalletDetailsScreen({super.key});

  @override
  State<WalletDetailsScreen> createState() => _WalletDetailsScreenState();
}

class _WalletDetailsScreenState extends State<WalletDetailsScreen> {
  @override
  void initState() {
    Get.put(WalletDetailsRepo());
    final controller = Get.put(WalletDetailsController(walletDetailsRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<WalletDetailsController>(
        builder: (controller) => MyCustomScaffold(
            pageTitle: "Ethereum (ETH)",
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomRoundedCard(
                      bgColor: MyColor.white.withValues(alpha: .09),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(MyStrings.totalBalance.tr, style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w700)),
                                  spaceDown(Dimensions.space15.h),
                                ],
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: EdgeInsets.all(Dimensions.space10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: MyColor.getBorderColor()),
                                  shape: BoxShape.circle,
                                  color: MyColor.white.withValues(alpha: .12),
                                ),
                                child: MyAssetImageWidget(
                                  assetPath: MyImages.docTime,
                                  isSvg: true,
                                  height: Dimensions.space20.h,
                                  width: Dimensions.space20.w,
                                ),
                              )
                            ],
                          ),
                          spaceDown(Dimensions.space15.h),
                          Text(
                            "8.42589632 ETH",
                            style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space28.sp, fontWeight: FontWeight.w700, color: MyColor.getHeadingTextColor()),
                          ),
                          spaceDown(Dimensions.space12.h),
                          Row(
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
                              Expanded(
                                child: Text(
                                  "\$122222.45",
                                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  spaceDown(Dimensions.space16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TradeButton(
                              color: MyColor.getSuccessColor(),
                              onTap: () {
                                Get.toNamed(RouteHelper.depositScreen);
                              },
                              name: MyStrings.deposit.tr)),
                      spaceSide(Dimensions.space15.w),
                      Expanded(
                          child: TradeButton(
                              color: MyColor.getSuccessColor(),
                              onTap: () {
                                Get.toNamed(RouteHelper.sendScreen);
                              },
                              name: MyStrings.send.tr)),
                      spaceSide(Dimensions.space15.w),
                      TradeButton(color: MyColor.getSuccessColor(), onTap: () {}, name: MyStrings.withdraw.tr),
                    ],
                  ),
                  spaceDown(Dimensions.space32.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      MyStrings.walletAddress,
                      style: theme.textTheme.headlineMedium?.copyWith(color: MyColor.getHeadingTextColor()),
                    ),
                  ),
                  Divider(
                    color: MyColor.getBorderColor(),
                  ),
                  spaceDown(Dimensions.space12.h),
                  ListView.separated(
                    separatorBuilder: (context, index) => spaceDown(Dimensions.space10),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17, color: MyColor.getHeadingTextColor()),
                            cursorColor: MyColor.getBodyTextColor(),
                            // controller: widget.controller,

                            autofocus: false,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              hintText: "0.00",
                              hintStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space17.sp),
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
                        ),
                        spaceSide(Dimensions.space8),
                        Container(
                          padding: EdgeInsets.all(Dimensions.space15.h),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), color: MyColor.getBodyTextColor().withValues(alpha: .4)),
                          child: Center(
                            child: MyAssetImageWidget(
                              assetPath: MyImages.copyCode,
                              isSvg: true,
                              height: Dimensions.space24.h,
                              width: Dimensions.space24.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
