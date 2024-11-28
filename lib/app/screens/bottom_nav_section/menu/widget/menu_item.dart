import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/custom_svg_picture.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class MenuItems extends StatelessWidget {
  final String imageSrc;
  final String label;
  final VoidCallback onPressed;
  final bool isSvgImage;

  const MenuItems({super.key, required this.imageSrc, required this.label, required this.onPressed, this.isSvgImage = true});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space10),
        color: MyColor.getTransparentColor(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: MyColor.getPrimaryColor().withOpacity(0.1), shape: BoxShape.circle),
                    child: isSvgImage ? CustomSvgPicture(image: imageSrc, color: MyColor.getPrimaryColor(), height: 17.5, width: 17.5) : Image.asset(imageSrc, height: 17.5, width: 17.5),
                  ),
                  const SizedBox(width: Dimensions.space15),
                  Expanded(child: Text(label.tr, style: theme.textTheme.titleSmall))
                ],
              ),
            ),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: MyColor.getTransparentColor(), shape: BoxShape.circle),
              child: Icon(Icons.arrow_forward_ios_rounded, color: MyColor.black, size: 15),
            ),
          ],
        ),
      ),
    );
  }
}
