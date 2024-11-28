import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';

class CardRow extends StatelessWidget {

  final String header;
  final String body;
  final bool alignmentEnd;

  const CardRow({super.key,
    this.alignmentEnd=false,
    required this.header,
    required this.body
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(header.tr,style: regularSmall.copyWith(color: MyColor.getBodyTextColor().withOpacity(0.6)),overflow: TextOverflow.ellipsis,),
        const SizedBox(height: Dimensions.space5),
        Text(body.tr, style: regularDefault.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)
      ],
    );
  }
}