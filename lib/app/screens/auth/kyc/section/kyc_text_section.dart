import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
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
    print(isRequired);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          isRequired: model.isRequired == 'optional' ? false : true,
          instructions: model.instruction,
          hintText: '',
          needOutlineBorder: true,
          labelText: (model.name ?? '').tr.capitalize,
          textInputType: MyUtils.getInputTextFieldType(model.type ?? 'text'),
          validator: (value) {
            if (isRequired && value.toString().isEmpty) {
              return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
            } else {
              return null;
            }
          },
          onChanged: (value) => onChanged(value),
          maxLines: model.type == "textarea" ? 5 : 1,
        ),
        const SizedBox(height: Dimensions.space10),
      ],
    );
  }
}
