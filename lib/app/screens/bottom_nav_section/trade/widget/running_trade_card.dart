import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/util_exporter.dart';

class RunningTradeCard extends StatelessWidget {
  const RunningTradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: List.generate(
        10,
        (index) => Container(
          margin: EdgeInsets.only(bottom: Dimensions.space16.w),
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
                    Spacer(),
                    Text("Limit:\$1.00 - \$99.00", style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space11.sp))
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
                    Text(MyStrings.window.tr, style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor())),
                    Expanded(child: Text(" 30 Minute", style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getSuccessColor(), fontWeight: FontWeight.w700))),
                    Text(MyStrings.avgTradeSpeed.tr, style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor())),
                    Text(" 20 Minute", style: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w700)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
