import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class ChooseFileItem extends StatelessWidget {
  final String fileName;
  const ChooseFileItem({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: 8),
      decoration: BoxDecoration(color: MyColor.getTransparentColor(), border: Border.all(color: MyColor.getBorderColor(), width: 0.5), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(Dimensions.space5),
              decoration: BoxDecoration(color: MyColor.black.withOpacity(0.04), borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyAssetImageWidget(
                    assetPath: MyImages.nid,
                    isSvg: true,
                  ),
                  Text(
                    MyStrings.chooseFile,
                    textAlign: TextAlign.center,
                    style: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                  ),
                ],
              )),
          Text(fileName.tr, style: regularDefault.copyWith(color: MyColor.getHeadingTextColor())),
        ],
      ),
    );
  }
}
