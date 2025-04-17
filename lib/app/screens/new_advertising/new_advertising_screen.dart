import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/gradiant_button.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/custom_text_field.dart';
import 'package:ovolutter/app/components/text-field/rounded_text_field.dart';
import 'package:ovolutter/app/components/text/label_text.dart';
import 'package:ovolutter/app/components/text/label_text_with_instructions.dart';
import 'package:ovolutter/app/screens/new_advertising/widgets/set_remarks_and_automatic_response.dart';
import 'package:ovolutter/app/screens/new_advertising/widgets/set_total_amount_and_payment_method.dart';
import 'package:ovolutter/app/screens/new_advertising/widgets/set_type_and_price.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/new_advertising/new_advertising_controller.dart';
import 'package:ovolutter/data/repo/new_advertising/new_advertising_repo.dart';

class NewAdvertisingScreen extends StatefulWidget {
  const NewAdvertisingScreen({super.key});

  @override
  State<NewAdvertisingScreen> createState() => _NewAdvertisingScreenState();
}

class _NewAdvertisingScreenState extends State<NewAdvertisingScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Get.put(NewAdvertisingRepo());
    final controller = Get.put(NewAdvertisingController(newAdvertisingRepo: Get.find()));

    super.initState();
    controller.tabController = TabController(length: 2, vsync: this);

    controller.tabController.addListener(() {
      if (controller.tabController.indexIsChanging) {
        controller.changeTab();
      } else if (controller.tabController.index != controller.tabController.previousIndex) {
        controller.changeTab();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<NewAdvertisingController>(
        builder: (controller) => MyCustomScaffold(
            pageTitle: MyStrings.newAdvertising.tr,
            padding: EdgeInsets.zero,
            body: Container(
              color: MyColor.getTransparentColor(),
              child: Theme(
                data: ThemeData(canvasColor: MyColor.getTransparentColor()),
                child: Stepper(
                  stepIconMargin: EdgeInsets.zero,
                  connectorColor: WidgetStateProperty.all(
                    MyColor.getBorderColor().withValues(alpha: .4),
                  ),
                  type: StepperType.horizontal,
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
                    Step(stepStyle: StepStyle(connectorThickness: Dimensions.space2.h, indexStyle: theme.textTheme.titleSmall, gradient: LinearGradient(colors: MyColor.cardGradiant), color: MyColor.white, connectorColor: MyColor.getBorderColor()), state: controller.currentStep > 0 ? StepState.complete : StepState.indexed, isActive: true, title: SizedBox(), content: SetTypeAndPrice()),
                    Step(stepStyle: StepStyle(connectorThickness: Dimensions.space2.h, indexStyle: theme.textTheme.titleSmall, gradient: controller.currentStep > 1 ? LinearGradient(colors: MyColor.cardGradiant) : null, color: MyColor.getBorderColor(), connectorColor: MyColor.getBorderColor()), state: controller.currentStep > 1 ? StepState.complete : StepState.indexed, title: SizedBox(), content: SetTotalAmountAndPaymentMethod()),
                    Step(stepStyle: StepStyle(connectorThickness: Dimensions.space2.h, indexStyle: theme.textTheme.titleSmall, gradient: controller.currentStep > 2 ? LinearGradient(colors: MyColor.cardGradiant) : null, color: MyColor.getBorderColor(), connectorColor: MyColor.getBorderColor()), state: controller.currentStep > 2 ? StepState.complete : StepState.indexed, isActive: true, title: SizedBox(), content: SetRemarksAndAutomaticResponse()),
                  ],
                ),
              ),
            )));
  }
}
