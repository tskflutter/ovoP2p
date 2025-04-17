import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class WalletCardSection extends StatelessWidget {
  const WalletCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: Dimensions.space10),
            decoration: BoxDecoration(color: MyColor.lightCardColor, border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.space12.w, vertical: Dimensions.space16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 15,
                            backgroundColor: MyColor.getCardBackgroundColor(),
                            child: MyAssetImageWidget(
                              assetPath: MyImages.eth,
                              boxFit: BoxFit.cover,
                              isSvg: true,
                              height: 24,
                            ),
                          ),
                          spaceSide(Dimensions.space8.w),
                          Expanded(
                            child: Text(
                              "ETH Wallet",
                              style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w700),
                            ),
                          ),
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
                  ),
                ),
                CustomDivider(
                  space: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.space12.w, vertical: Dimensions.space16.h),
                  child: Row(
                    children: [
                      MyAssetImageWidget(
                        assetPath: MyImages.trxEdit,
                        height: Dimensions.space16.h,
                        width: Dimensions.space16.h,
                        isSvg: true,
                      ),
                      spaceSide(Dimensions.space4.w),
                      Expanded(child: Text(MyStrings.transaction.tr, style: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()))),
                      TradeButton(
                        onTap: () {
                          Get.toNamed(RouteHelper.walletDetailsScreen);
                        },
                        name: MyStrings.deposit.tr,
                        hasBorder: false,
                        horizontalPadding: Dimensions.space16.w,
                        verticalPadding: Dimensions.space8.h,
                        borderRadious: Dimensions.space8,
                        color: MyColor.getSuccessColor(),
                      ),
                      spaceSide(Dimensions.space8.w),
                      TradeButton(
                        onTap: () {},
                        name: MyStrings.withdraw.tr,
                        hasBorder: false,
                        horizontalPadding: Dimensions.space16.w,
                        verticalPadding: Dimensions.space8.h,
                        borderRadious: Dimensions.space8,
                        color: MyColor.getErrorColor(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
