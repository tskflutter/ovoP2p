import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class ActiveTradeSection extends StatefulWidget {
  const ActiveTradeSection({super.key});

  @override
  State<ActiveTradeSection> createState() => _ActiveTradeSectionState();
}

class _ActiveTradeSectionState extends State<ActiveTradeSection> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              MyStrings.activeTrade.tr,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp),
            ),
            spaceSide(Dimensions.space8.w),
            Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: MyColor.cardGradiant), borderRadius: BorderRadius.circular(Dimensions.space8)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.space8.w, vertical: Dimensions.space4.h),
                child: Center(
                    child: Text(
                  "05",
                  style: theme.textTheme.labelSmall?.copyWith(color: MyColor.white, fontWeight: FontWeight.w700),
                )),
              ),
            ),
            Spacer(),
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  stops: [0.04, 0.4],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: MyColor.cardGradiant,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                MyStrings.viewAll.tr,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall?.copyWith(
                  decoration: TextDecoration.underline,
                  fontSize: Dimensions.space15.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColor.getBodyTextColor(),
                ),
              ),
            )
          ],
        ),
        spaceDown(Dimensions.space16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        margin: EdgeInsets.only(right: Dimensions.space16.w),
                        decoration: BoxDecoration(color: MyColor.lightCardColor, border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space12)),
                        padding: EdgeInsets.symmetric(vertical: Dimensions.space16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.space14.w),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 13,
                                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyW2MAFrFnfa_bT1jSttLbmvfotJcqQyCCGg&s"),
                                  ),
                                  spaceSide(Dimensions.space8.w),
                                  Text(
                                    "Samantha Blake",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: MyColor.getHeadingTextColor(),
                                    ),
                                  ),
                                  spaceSide(Dimensions.space4.w),
                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space10.w),
                                      decoration: BoxDecoration(color: MyColor.getSuccessColor(), borderRadius: BorderRadius.circular(Dimensions.space200)),
                                      child: Text(
                                        "Buy",
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          color: MyColor.getHeadingTextColor(),
                                        ),
                                      )),
                                  Spacer(),
                                  Text("Nov 30, 2024 12:37 PM", style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space11.sp))
                                ],
                              ),
                            ),
                            spaceDown(Dimensions.space15.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.space14.w, vertical: Dimensions.space8.h),
                              decoration: BoxDecoration(color: MyColor.lightCardStepColor),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 15,
                                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLmMrr1fC5bVIE66ZENl95VJHoXHkeoxJsAo9d5Mk-Km6UkgLkmMu8iO2PUwGoxt21WYQ&usqp=CAU"),
                                  ),
                                  spaceSide(Dimensions.space4.w),
                                  Expanded(
                                    child: Text(
                                      "PayPal",
                                      style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, fontWeight: FontWeight.w700, color: MyColor.getHeadingTextColor()),
                                    ),
                                  ),
                                  Text(
                                    "\$3,706.22/ETH",
                                    style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: MyColor.getHeadingTextColor()),
                                  ),
                                ],
                              ),
                            ),
                            spaceDown(Dimensions.space15.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.space14.w),
                              child: Row(
                                children: [
                                  Text(MyStrings.status.tr, style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor())),
                                  Expanded(child: Text(" Escrow Funded", style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getSuccessColor(), fontWeight: FontWeight.w700))),
                                  Text(MyStrings.window.tr, style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor())),
                                  Text(" 30 Minute", style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w700)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned.directional(
                        end: 0,
                        textDirection: TextDirection.ltr,
                        child: MyAssetImageWidget(
                          assetPath: MyImages.blurBg,
                          boxFit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
