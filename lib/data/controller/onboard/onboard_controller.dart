import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/data/model/onboard/onboard_model.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  List<OnBoardModel> appBanners = [
    OnBoardModel(
      title: "Trade with Confidence ",
      bgImage: MyImages.onBoardImageOneBg,
      subtitle: "Escrow-protected transactions ensure safety for every trade!",
      frontImage: MyImages.onBoardImageOneFront,
      isSvg: true,
      bgcolor: const Color(0xffb25cea),
      icon: Icons.photo,
    ),
    OnBoardModel(
      frontImage: MyImages.onBoardImageTwoFront,
      bgImage: MyImages.onBoardImageTwoBg,
      title: "Pay Your Way",
      subtitle: "Choose from multiple payment methods tailored to your needs.",
      isSvg: true,
      bgcolor: const Color(0xffff5c9d),
      icon: Icons.favorite,
    ),
    OnBoardModel(
      title: "Stay Updated with Prices",
      subtitle: "Track cryptocurrency prices and make informed trades",
      frontImage: MyImages.onBoardImageThreeFront,
      bgImage: MyImages.onBoardImageThreeBg,
      isSvg: true,
      bgcolor: const Color(0xff006bcc),
      icon: Icons.share,
    )
  ];

  int currentIndex = 0;
  PageController? controller = PageController();

  void setCurrentIndex(int index) {
    currentIndex = index;
    controller?.animateToPage(
      index,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    update();
  }

  LinearGradient generateGradientVariation(Color baseColor, GradientIntensity intensity) {
    Color generateVariation() {
      final int variation = intensity.index * 50; // Adjust the factor based on intensity levels
      final int red = min(255, baseColor.red + variation);
      final int green = min(255, baseColor.green + variation);
      final int blue = min(255, baseColor.blue + variation);

      return Color.fromRGBO(red, green, blue, 1.0);
    }

    final Color color1 = baseColor;
    final Color color2 = generateVariation();

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        color2,
        color1,
      ],
    );
  }
}

enum GradientIntensity { accent, soft, medium, hard }
// gradient: LinearGradient(
//   colors: [
//     Color(0xffcf92fb),
//     Color(0xffbf73f1),
//   ],
// ),
