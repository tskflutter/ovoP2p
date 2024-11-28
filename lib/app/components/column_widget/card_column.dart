import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/dimensions.dart';

import '../../../core/utils/my_color.dart';

import '../../../core/utils/style.dart';

class CardColumn extends StatelessWidget {

  final String header;
  final String body;
  final bool alignmentEnd;
  final bool alignmentCenter;
  final bool isDate;
  final Color? textColor;
  String? subBody;
  TextStyle? headerTextStyle;
  TextStyle? bodyTextStyle;
  TextStyle? subBodyTextStyle;
  bool isOnlyHeader;
  bool? isOnlyBody;
  final int bodyMaxLine;

  double? space = 5;

  CardColumn({super.key,
    this.bodyMaxLine = 1,
    this.alignmentEnd = false,
    this.alignmentCenter = false,
    required this.header,
    this.isDate = false,
    this.textColor,
    this.headerTextStyle,
    this.bodyTextStyle,
    required this.body,
    this.subBody,
    this.isOnlyHeader = false,
    this.isOnlyBody = false,
    this.space
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
            crossAxisAlignment: alignmentCenter
                ? CrossAxisAlignment.center
                : alignmentEnd
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              Text(
                header.tr,
                style: headerTextStyle ?? regularSmall.copyWith(color: Theme.of(context).textTheme.titleLarge!.color, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: space,
              ),
              isOnlyHeader? const SizedBox.shrink() : Text(
                body.tr,
                maxLines: bodyMaxLine,
                style: isDate ? regularDefault.copyWith(fontStyle: FontStyle.italic, color: textColor ?? MyColor.getBodyTextColor(), fontSize: Dimensions.fontSmall) : bodyTextStyle ?? regularSmall.copyWith(color: textColor ??Theme.of(context).textTheme.titleLarge!.color, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: space,
              ),
              subBody != null
                  ? Text(subBody!.tr, maxLines: bodyMaxLine, style: isDate ? regularDefault.copyWith(fontStyle: FontStyle.italic, color: textColor ?? MyColor.getBodyTextColor(), fontSize: Dimensions.fontSmall) : subBodyTextStyle ?? regularSmall.copyWith(color: textColor ?? MyColor.getBodyTextColor().withOpacity(0.5), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)
                  : const SizedBox.shrink()
            ],
          );
  }
}
