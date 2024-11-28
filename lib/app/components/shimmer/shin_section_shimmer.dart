import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShpinSectiionShimmer extends StatelessWidget {
  const ShpinSectiionShimmer({super.key});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: MyColor.getBorderColor().withOpacity(0.2),
      highlightColor: MyColor.getPrimaryColor().withOpacity(0.7),
      child: Container(
        decoration: BoxDecoration(color: MyColor.getBorderColor().withOpacity(0.2), borderRadius: BorderRadius.circular(2)),
        height: 150,
        width: context.width,
      ),
    );
  }
}
