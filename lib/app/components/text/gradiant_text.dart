import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient = LinearGradient(colors: [
    MyColor.lightSecondaryButton,
    MyColor.lightSecondary,
  ]);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
