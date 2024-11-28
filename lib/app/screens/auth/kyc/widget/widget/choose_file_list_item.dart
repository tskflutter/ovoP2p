import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';

class ChooseFileItem extends StatelessWidget {
  final String fileName;
  const ChooseFileItem({super.key,required this.fileName});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: 8),
      decoration: BoxDecoration(
        color: MyColor.getTransparentColor(),
        border: Border.all(color: MyColor.getBorderColor(), width: 0.5),
        borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(Dimensions.space5),
            decoration: BoxDecoration(color: MyColor.black.withOpacity(0.04), borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(MyStrings.chooseFile, textAlign: TextAlign.center, style: regularDefault.copyWith(color: MyColor.getPrimaryColor()), )
          ),
          const SizedBox(width: Dimensions.space15,),
          Expanded(
            flex: 5,
            child:Text(fileName.tr,style:regularDefault.copyWith(color: MyColor.black))
          ),
        ],
      ),
    );
  }
}
