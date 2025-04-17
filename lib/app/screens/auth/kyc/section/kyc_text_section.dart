import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/text-field/rounded_text_field.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/data/model/kyc/kyc_response_model.dart' as kyc;
import 'package:ovolutter/app/components/text-field/custom_text_field.dart';
import 'package:get/get.dart';

class KycTextAnEmailSection extends StatelessWidget {
  kyc.KycFormModel model;
  Function onChanged;

  KycTextAnEmailSection({
    super.key,
    required this.onChanged,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isRequired = model.isRequired == 'optional' ? false : true;
    printX(isRequired);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedTextField(
          fillColor: MyColor.pcBackground,
          labelFillColor: MyColor.pcBackground,
          isRequired: model.isRequired == 'optional' ? false : true,
          instructions: model.instruction,
          onChanged: (value) => onChanged(value),
          maxLine: model.type == "textarea" ? 5 : 1,
          validator: (value) {
            if (isRequired && value.toString().isEmpty) {
              return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
            } else {
              return null;
            }
          },
          keyboardType: MyUtils.getInputTextFieldType(model.type ?? 'text'),
          labelText: (model.name ?? '').tr.capitalize ?? "",
          hintText: '',
        ),
        const SizedBox(height: Dimensions.space10),
      ],
    );
  }
}
