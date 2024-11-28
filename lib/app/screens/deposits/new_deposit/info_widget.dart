import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/row_widget/custom_row.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../data/controller/deposit/add_new_deposit_controller.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return GetBuilder<AddNewDepositController>(builder: (controller){
      bool showRate = controller.isShowRate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimensions.space20,),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
            border: Border.all(color: MyColor.getBorderColor())
          ),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              CustomRow(firstText: MyStrings.depositLimit.tr, lastText: controller.depositLimit,),
              CustomRow(firstText: MyStrings.depositCharge.tr, lastText: controller.charge,),
              CustomRow(firstText: MyStrings.payable.tr, lastText: controller.payableText,showDivider: showRate,),
              showRate?CustomRow(firstText: MyStrings.conversionRate.tr, lastText: controller.conversionRate,showDivider: showRate,): const SizedBox.shrink(),
              showRate?CustomRow(firstText: 'in ${controller.paymentMethod?.currency}'.tr, lastText: controller.inLocal,showDivider: false,):const SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
    }
    );
  }
}
