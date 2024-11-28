import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class MatchCardShimmer extends StatelessWidget {
  const MatchCardShimmer({super.key});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: MyColor.getBorderColor().withOpacity(0.2),
      highlightColor: MyColor.getPrimaryColor().withOpacity(0.7),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(color: MyColor.getBorderColor().withOpacity(0.2), borderRadius: BorderRadius.circular(Dimensions.mediumRadius)),
        height: 150,
        width: context.width,
      ),
    );
  }
}
