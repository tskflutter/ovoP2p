import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';

class FormRow extends StatelessWidget {

  final String label;
  final bool isRequired;

  const FormRow({super.key,
    required this.label,
    required this.isRequired
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label.tr, style: regularDefault.copyWith(color: MyColor.black)),
        Text(isRequired?' *':'',style: boldDefault.copyWith(color: MyColor.getErrorColor()))
      ],
    );
  }
}
