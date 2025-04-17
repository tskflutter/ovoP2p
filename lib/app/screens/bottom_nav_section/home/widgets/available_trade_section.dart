import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/available_trade_card.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/currency_selection_bottomsheet.dart';
import 'package:ovolutter/core/utils/app_style.dart' show spaceDown;
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart' show Dimensions, MyColor, MyImages, SizeExtension, spaceSide;
import 'package:ovolutter/data/controller/home/home_controller.dart';
import 'package:show_up_animation/show_up_animation.dart';

class AvailableTradeSection extends StatefulWidget {
  const AvailableTradeSection({super.key});

  @override
  State<AvailableTradeSection> createState() => _AvailableTradeSectionState();
}

class _AvailableTradeSectionState extends State<AvailableTradeSection> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<HomeController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MyStrings.availableTrade.tr,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getHeadingTextColor()),
            ),
            spaceDown(Dimensions.space8.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.changeStatus();
                    },
                    child: TradeButton(
                      onTap: () {},
                      name: MyStrings.buy.tr,
                      hasBorder: controller.isBuy ? false : true,
                      color: controller.isBuy ? MyColor.getSuccessColor() : MyColor.lightCardColor,
                      isHeadingTextColor: controller.isBuy ? true : false,
                    ),
                  ),
                ),
                spaceSide(Dimensions.space8.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.delay();
                      controller.changeStatus();
                    },
                    child: TradeButton(
                      onTap: () {},
                      name: MyStrings.sell.tr,
                      isHeadingTextColor: !controller.isBuy ? true : false,
                      color: !controller.isBuy ? MyColor.getSuccessColor() : MyColor.lightCardColor,
                    ),
                  ),
                ),
                spaceSide(Dimensions.space8.w),
                GestureDetector(
                  onTap: () {
                    CurrencySelectionBottomsheet.currencySelectionBottomsheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimensions.space13.h, horizontal: Dimensions.space12.w),
                    decoration: BoxDecoration(
                        color: MyColor.lightCardColor,
                        border: Border.all(
                          color: MyColor.getBorderColor(),
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.space12.w)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("BTC", style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor())),
                        spaceSide(Dimensions.space45.w),
                        MyAssetImageWidget(
                          assetPath: MyImages.arrowDown,
                          isSvg: true,
                          height: Dimensions.space12.h,
                          width: Dimensions.space12.h,
                        )
                      ],
                    ),
                  ),
                ),
                spaceSide(Dimensions.space8),
                Container(
                  padding: EdgeInsets.all(Dimensions.space12),
                  decoration: BoxDecoration(
                      color: MyColor.lightCardColor,
                      border: Border.all(
                        color: MyColor.getBorderColor(),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.space12.w)),
                  child: Center(
                    child: MyAssetImageWidget(
                      assetPath: MyImages.filter,
                      isSvg: true,
                      height: Dimensions.space24.h,
                      width: Dimensions.space24.h,
                    ),
                  ),
                )
              ],
            ),
            spaceDown(Dimensions.space16.h),
            ShowUpAnimation(
              key: ValueKey(controller.isBuy),
              direction: controller.isBuy ? Direction.horizontal : Direction.vertical,
              curve: controller.isBuy ? Curves.decelerate : Curves.easeInOut,
              child: AvailableTradeCard(),
            ),
          ],
        ),
      ),
    );
  }
}
