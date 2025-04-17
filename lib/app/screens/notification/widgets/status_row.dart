import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/advance_switch/custom_switch.dart';
import 'package:ovolutter/core/utils/my_strings.dart';

class StatusRow extends StatelessWidget {
  final bool status;
  final ValueChanged onTap;
  final String title;
  const StatusRow({super.key, required this.status, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr,
          style: theme.textTheme.bodyLarge,
        ),
        CustomSwitch(value: status, onChanged: onTap)
      ],
    );
  }
}
