import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class CustomSvgPicture extends StatelessWidget {
  final String image;
  final double height, width;
  final Color? color;
  final BoxFit? fit;

  const CustomSvgPicture({super.key, this.fit, required this.image, this.height = 20, this.width = 20, this.color});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return fit != null ? SvgPicture.asset(image, fit: fit!, colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null, height: height, width: width) : SvgPicture.asset(image, height: height, width: width,colorFilter: color!= null ?ColorFilter.mode(color!, BlendMode.srcIn) : null,);
  }
}
