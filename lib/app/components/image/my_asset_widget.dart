import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG rendering

class MyAssetImageWidget extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit boxFit;
  final bool isSvg;
  final Color? color;

  const MyAssetImageWidget({
    super.key,
    required this.assetPath,
    this.height = 80,
    this.width = 100,
    this.radius = 5,
    this.boxFit = BoxFit.fitHeight,
    this.isSvg = false, // Set to true if SVG
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        // color: color?.withOpacity(0.2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: isSvg
            ? _buildSvgImage() // Handle SVG images
            : _buildRasterImage(), // Handle PNG/JPG images
      ),
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
      fit: boxFit,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null, // Apply color filter if color is provided
    );
  }

  Widget _buildRasterImage() {
    return Image.asset(
      assetPath,
      height: height,
      width: width,
      fit: boxFit,
      color: color,
      colorBlendMode: color != null ? BlendMode.srcIn : null,
    );
  }
}
