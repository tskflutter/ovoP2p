import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';

import 'package:ovolutter/core/utils/util_exporter.dart';

class StepSection extends StatelessWidget {
  const StepSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        MyAssetImageWidget(
          assetPath: MyImages.gradiantTik,
          isSvg: true,
          height: Dimensions.space30.h,
          width: Dimensions.space30.h,
        ),
        spaceDown(Dimensions.space5.h),
        Container(
          height: 140,
          width: 2,
          color: MyColor.getBorderColor(),
        ),
        spaceDown(Dimensions.space5.h),
        CircleAvatar(
          maxRadius: 13,
          backgroundColor: MyColor.pcBackground,
          child: Text(
            "2",
            style: theme.textTheme.titleSmall,
          ),
        ),
        spaceDown(Dimensions.space5.h),
        Container(
          height: 140,
          width: 2,
          color: MyColor.getBorderColor(),
        ),
        spaceDown(Dimensions.space5.h),
        CircleAvatar(
          maxRadius: 13,
          backgroundColor: MyColor.pcBackground,
          child: Text(
            "3",
            style: theme.textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}
