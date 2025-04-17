import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

import '../../../../../core/utils/dimensions.dart';

class MenuCardWidget extends StatelessWidget {
  final Widget child;
  final double marginBottom;

  const MenuCardWidget({super.key, required this.child, this.marginBottom = 10});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(width: MediaQuery.of(context).size.width, margin: EdgeInsets.only(bottom: marginBottom), padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space20), border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground), child: child);
  }
}
