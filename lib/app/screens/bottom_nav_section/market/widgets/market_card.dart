import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/user_data.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/app_style.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/market_controller/market_controller.dart';

class MarketCard extends StatelessWidget {
  final bool isSell;
  const MarketCard({super.key, this.isSell = false});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<MarketController>(
      builder: (controller) => Column(children: [
        spaceDown(Dimensions.space24.h),
        UserBio(
            name: "Albert Flores",
            email: "Completion rate 90%",
            nameTextStyle: theme.textTheme.headlineSmall?.copyWith(
              fontSize: Dimensions.space16.sp,
            ),
            emailTextStyle: theme.textTheme.bodySmall),
        spaceDown(Dimensions.space10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "\$3706.00",
                      style: theme.textTheme.headlineSmall?.copyWith(fontSize: Dimensions.space17.sp),
                    ),
                    spaceSide(Dimensions.space10.w),
                    Text(
                      "USD/ETH",
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(
                  "Limit: \$1.00 - \$99.00 ",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: Dimensions.space15.sp,
                  ),
                ),
              ],
            ),
            TradeButton(
              onTap: () {
                Get.toNamed(RouteHelper.tradeDetailsScreen);
              },
              name: isSell ? MyStrings.sell.tr : MyStrings.buy.tr,
              hasBorder: false,
              color: !isSell ? MyColor.getSuccessColor() : MyColor.getErrorColor(),
              horizontalPadding: Dimensions.space24.w,
              verticalPadding: Dimensions.space9.h,
            )
          ],
        ),
        spaceDown(Dimensions.space10.h),
        Wrap(
          spacing: Dimensions.space10.h,
          runSpacing: Dimensions.space10.w,
          children: List.generate(controller.items.length, (index) {
            return Container(
              padding: EdgeInsets.all(Dimensions.space8),
              decoration: BoxDecoration(color: MyColor.getCardBackgroundColor(), border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space8.sp)),
              child: Text(controller.items[index].toString()),
            );
          }),
        ),
        spaceDown(Dimensions.space15.h),
        Divider(
          color: MyColor.getBorderColor(),
        )
      ]),
    );
  }
}
