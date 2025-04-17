import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/text-field/custom_text_field.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/new_advertising/new_advertising_controller.dart';

class SetRemarksAndAutomaticResponse extends StatefulWidget {
  const SetRemarksAndAutomaticResponse({super.key});

  @override
  State<SetRemarksAndAutomaticResponse> createState() => _SetRemarksAndAutomaticResponseState();
}

class _SetRemarksAndAutomaticResponseState extends State<SetRemarksAndAutomaticResponse> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<NewAdvertisingController>(
      builder: (controller) => Column(
        children: [
          CustomRoundedCard(
              child: Column(
            children: [
              CustomTextField(
                labelText: MyStrings.termsoftheTrade.tr,
                needOutlineBorder: true,
                hintText: MyStrings.termswillBeDisplayedHere.tr,
                isPassword: false,
                // controller: controller.messageController,
                maxLines: 5,
                fillColor: MyColor.getBodyTextColor().withValues(alpha: .12),
                //  focusNode: controller.messageFocusNode,
                isShowSuffixIcon: false,
                textStyle: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                onSuffixTap: () {},
                onChanged: (value) {},
              ),
              spaceDown(Dimensions.space16.h),
              CustomTextField(
                labelText: MyStrings.autoReply.tr,
                needOutlineBorder: true,
                hintText: MyStrings.theAutoReplyMessageWillbeSentToThe.tr,
                isPassword: false,
                // controller: controller.messageController,
                maxLines: 5,
                fillColor: MyColor.getBodyTextColor().withValues(alpha: .12),
                //  focusNode: controller.messageFocusNode,
                isShowSuffixIcon: false,
                textStyle: theme.textTheme.bodySmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                onSuffixTap: () {},
                onChanged: (value) {},
              ),
            ],
          )),
          spaceDown(Dimensions.space50.h),
          Row(
            children: [
              Expanded(
                child: CustomElevatedBtn(
                  bgColor: MyColor.getHeadingTextColor().withValues(alpha: .25),
                  hasGradiant: false,
                  textColor: MyColor.getBodyTextColor(),
                  text: MyStrings.previous.tr,
                  onTap: () {
                    controller.currentStep--;
                    controller.update();
                  },
                  textStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getBodyTextColor()),
                ),
              ),
              spaceSide(Dimensions.space10.w),
              Expanded(
                flex: 2,
                child: CustomElevatedBtn(
                  text: MyStrings.post.tr,
                  onTap: () {
                    Get.toNamed(RouteHelper.newAdvertisingSuccessScreen);
                  },
                  textStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getHeadingTextColor()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
