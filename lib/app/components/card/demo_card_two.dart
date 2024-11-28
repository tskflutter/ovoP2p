import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/custom_outlined_button.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/app/components/image/my_image_widget.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util.dart';


import 'package:get/get.dart';

class DemoCardTwo extends StatelessWidget {
  DemoCardTwo({super.key});
  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space15),
      margin: const EdgeInsets.only(bottom: Dimensions.space10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.cardColor,
        boxShadow: MyUtils.getShadow(color: MyColor.getBorderColor(), blurRadius: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nov 19, 2023 - 9:00 AM', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
          CustomDivider(
            space: 10,
            color: MyColor.getBorderColor(),
            thickness: 0.6,
            height: 3,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyImageWidget(
                imageUrl: 'http://surl.li/rxexk',
                radius: 30,
                height: 65,
                width: 65,
              ),
              const SizedBox(width: Dimensions.space15),
              Column(
                children: [
                  Text(
                    "Dr. Kenny Adeola",
                    // style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: Dimensions.fontLarge, fontWeight: FontWeight.w700),
                    style: title.copyWith(color: MyColor.getBodyTextColor(), fontSize: 15),
                  ),
                  const SizedBox(height: Dimensions.space2),
                  Text("General Practitioner", style: regularSmall),
                  const SizedBox(height: Dimensions.space5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: MyColor.getPrimaryColor(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                             Icon(
                              CupertinoIcons.star_fill,
                              color: MyColor.getWarningColor(),
                              size: 14,
                            ),
                            const SizedBox(width: Dimensions.space2),
                            Text(
                              '4.8',
                              style:regularSmall.copyWith(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: Dimensions.space10),
                      Text('(130 reviews)', style: regularSmall),
                    ],
                  ),
                  const SizedBox(height: Dimensions.space5),
                  Row(
                    children: [
                      Text("Booking ID: ", style: boldDefault),
                      Text("#645560", style: boldDefault.copyWith(color: MyColor.getPrimaryColor())),
                    ],
                  ),
                ],
              )
            ],
          ),
          CustomDivider(
            space: 15,
            color: MyColor.getBorderColor(),
            thickness: 0.6,
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedBtn(
                  btnText: "Cancel",
                  onTap: () {},
                  borderColor: MyColor.getPrimaryColor(),
                  borderWidth: 2,
                  radius: 8,
                  textStyle: title.copyWith(color: MyColor.getPrimaryColor(), fontSize: Dimensions.fontDefault),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CustomElevatedBtn(
                  text: "Reschedule",
                  press: () {},
                  radius: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
