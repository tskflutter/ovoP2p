import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/screens/trade_payment_and_chat/trade_payment_widgets/order_creation_details_card.dart';
import 'package:ovolutter/app/screens/trade_payment_and_chat/trade_payment_widgets/seller_account_details_card.dart';
import 'package:ovolutter/core/utils/app_style.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/controller/trade_details_and_chat/trade_details_and_chat_controller.dart';

class StepperSection extends StatefulWidget {
  const StepperSection({super.key});

  @override
  State<StepperSection> createState() => _StepperSectionState();
}

class _StepperSectionState extends State<StepperSection> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TradeDetailsAndChatController>(
      builder: (controller) => Expanded(
          child: Stepper(
        connectorColor: WidgetStateProperty.all(
          MyColor.getBorderColor().withValues(alpha: .4),
        ),
        type: StepperType.vertical,
        controlsBuilder: (context, controller) {
          return const SizedBox.shrink();
        },
        margin: EdgeInsets.all(0),
        currentStep: controller.currentStep,
        onStepTapped: (step) => setState(() {
          controller.currentStep = step;
        }),
        physics: NeverScrollableScrollPhysics(),
        steps: [
          Step(
            stepStyle: StepStyle(indexStyle: theme.textTheme.titleSmall, gradient: LinearGradient(colors: MyColor.cardGradiant), color: MyColor.white, connectorColor: MyColor.getBorderColor()),
            state: controller.currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: true,
            title: Text(MyStrings.orderCreated.tr,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: Dimensions.space16.sp,
                )),
            content: OrderCreationDetailsCard(),
          ),
          Step(
            stepStyle: StepStyle(indexStyle: theme.textTheme.titleSmall, gradient: controller.currentStep > 1 ? LinearGradient(colors: MyColor.cardGradiant) : null, color: MyColor.pcBackground, connectorColor: MyColor.getBorderColor()),
            state: controller.currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: true,
            title: Text("Transfer \$12,256.00 USD",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: Dimensions.space16.sp,
                )),
            content: Column(
              children: [
                Text(
                  MyStrings.transfertheFundstoTheSellersAccountProvidedBelow.tr,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space12.sp, color: MyColor.getBodyTextColor()),
                ),
                spaceDown(Dimensions.space10.h),
                SellerAccountDetailsCard(),
              ],
            ),
          ),
          Step(
            stepStyle: StepStyle(indexStyle: theme.textTheme.titleSmall, gradient: controller.currentStep > 2 ? LinearGradient(colors: MyColor.cardGradiant) : null, color: MyColor.pcBackground, connectorColor: MyColor.getBorderColor()),
            state: controller.currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: true,
            title: Text(MyStrings.notifySeller.tr,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: Dimensions.space16.sp,
                )),
            content: Text(
              MyStrings.afterPaymentInst.tr,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space12.sp, color: MyColor.getBodyTextColor()),
            ),
          ),
        ],
      )),
    );
  }
}
