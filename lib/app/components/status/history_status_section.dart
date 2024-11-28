import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';

class HistoryStatusSection extends StatelessWidget {

  final String status;

  const HistoryStatusSection({
    super.key,
    required this.status
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color:
                status == "1" ? MyColor.getSuccessColor()
              : status == "2" ? MyColor.getWarningColor()
              : status == "3" ? MyColor.getErrorColor(): MyColor.getSuccessColor())
      ),
      child: Text(
        status == "1" ? MyStrings.approved.tr
            : status == "2" ? MyStrings.pending.tr
            : status == "3" ? MyStrings.rejected.tr
            : "",
        textAlign: TextAlign.center,
        style: regularExtraSmall.copyWith(
            color: status == "1" ? MyColor.getSuccessColor()
                : status == "2" ? MyColor.getWarningColor()
                : status == "3" ? MyColor.getErrorColor() : MyColor.getSuccessColor(),
        ),
      ),
    );
  }
}
