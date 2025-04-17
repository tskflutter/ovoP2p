import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/trade_details/trade_details_screen.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class ExchangeSection extends StatefulWidget {
  const ExchangeSection({super.key});

  @override
  State<ExchangeSection> createState() => _ExchangeSectionState();
}

class _ExchangeSectionState extends State<ExchangeSection> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: CustomPaint(
                painter: BottomCurveDarkShapePainter(),
                size: Size.infinite,
                child: Opacity(
                  opacity: 1.0, // Make sure it's visible
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: MyColor.getSuccessColor(),
                              backgroundImage: NetworkImage("https://pngimg.com/uploads/dollar_sign/dollar_sign_PNG35.png"),
                            ),
                            spaceSide(Dimensions.space8),
                            Expanded(
                              child: Text(
                                "ETH",
                                style: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space20.sp),
                              ),
                            ),
                            TradeButton(textStyle: theme.textTheme.titleSmall?.copyWith(fontSize: Dimensions.space11, color: MyColor.getBodyTextColor()), isHeadingTextColor: false, color: MyColor.lightCardColor2, verticalPadding: Dimensions.space5, horizontalPadding: Dimensions.space15, borderRadious: 200, onTap: () {}, name: MyStrings.sell.tr)
                          ],
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space35, color: MyColor.getBodyTextColor()),
                          cursorColor: MyColor.getBodyTextColor(),
                          // controller: widget.controller,
                          autofocus: false,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "0.00000000",
                            hintStyle: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space35),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.getTransparentColor()),
                            ),
                            focusColor: MyColor.transparent,
                            fillColor: MyColor.getTransparentColor(),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.getTransparentColor()),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.getTransparentColor()),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.getTransparentColor()),
                            ),
                          ),
                          onChanged: (v) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MyStrings.balance.tr,
                              style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor()),
                            ),
                            Text(
                              " 0.00005884 ETH",
                              style: theme.textTheme.bodySmall?.copyWith(),
                            ),
                            spaceSide(Dimensions.space8.w),
                            TradeButton(
                              isHeadingTextColor: false,
                              color: MyColor.getSecondaryColor().withValues(alpha: .2),
                              verticalPadding: Dimensions.space5,
                              horizontalPadding: Dimensions.space15,
                              borderRadious: 200,
                              onTap: () {},
                              name: MyStrings.add.tr,
                              isGradianTextColor: true,
                              textStyle: theme.textTheme.titleSmall?.copyWith(fontSize: Dimensions.space11.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            spaceDown(Dimensions.space10),
            Container(
                width: double.infinity,
                height: 200,
                child: CustomPaint(
                  painter: TopCurveDarkShapePainter(),
                  size: Size.infinite,
                  child: Opacity(
                    opacity: 1.0, // Make sure it's visible
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 15,
                                backgroundColor: MyColor.getSuccessColor(),
                                backgroundImage: NetworkImage("https://pngimg.com/uploads/dollar_sign/dollar_sign_PNG35.png"),
                              ),
                              spaceSide(Dimensions.space8),
                              Expanded(
                                child: Text(
                                  "ETH",
                                  style: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space20.sp),
                                ),
                              ),
                              TradeButton(textStyle: theme.textTheme.titleSmall?.copyWith(fontSize: Dimensions.space11, color: MyColor.getBodyTextColor()), isHeadingTextColor: false, color: MyColor.lightCardColor2, verticalPadding: Dimensions.space5, horizontalPadding: Dimensions.space15, borderRadious: 200, onTap: () {}, name: MyStrings.receive.tr)
                            ],
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space35, color: MyColor.getBodyTextColor()),
                            cursorColor: MyColor.getBodyTextColor(),
                            // controller: widget.controller,
                            autofocus: false,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "0.00000000",
                              hintStyle: theme.textTheme.headlineLarge?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space35),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColor.getTransparentColor()),
                              ),
                              focusColor: MyColor.transparent,
                              fillColor: MyColor.getTransparentColor(),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColor.getTransparentColor()),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColor.getTransparentColor()),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColor.getTransparentColor()),
                              ),
                            ),
                            onChanged: (v) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.space22),
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: MyColor.cardGradiant)),
              child: MyAssetImageWidget(
                assetPath: MyImages.exchange,
                isSvg: true,
                height: Dimensions.space28.h,
                width: Dimensions.space24.h,
              ),
            )))
      ],
    );
  }
}
