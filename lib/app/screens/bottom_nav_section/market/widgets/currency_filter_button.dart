import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/market_controller/market_controller.dart';

class CurrencyFilterButton extends StatelessWidget {
  const CurrencyFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<MarketController>(
      builder: (controller) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                10,
                (index) => GestureDetector(
                      onTap: () {
                        controller.changeCurrencyIndex(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: Dimensions.space8.w),
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space5),
                        decoration: BoxDecoration(
                            border: Border.all(color: controller.selectedCurrencyIndex != index ? MyColor.getBorderColor() : MyColor.getTransparentColor()),
                            color: controller.selectedCurrencyIndex != index ? MyColor.getCardBackgroundColor() : null,
                            gradient: controller.selectedCurrencyIndex == index
                                ? LinearGradient(
                                    colors: MyColor.cardGradiant,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(Dimensions.space8)),
                        child: Center(
                          child: Text(
                            "ETH",
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: MyColor.getHeadingTextColor(),
                              fontSize: Dimensions.space15.sp,
                            ),
                          ),
                        ),
                      ),
                    )),
          )),
    );
  }
}
