import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/controller/onboard/onboard_controller.dart';
import 'package:ovolutter/data/model/onboard/onboard_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class OnBoardRippleBody extends StatelessWidget {
  OnBoardModel data;
  OnBoardController controller;
  OnBoardRippleBody({
    super.key,
    required this.data,
    required this.controller,
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: controller.generateGradientVariation(data.bgcolor!, GradientIntensity.medium),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.isLandscape ? const SizedBox(height: 20) : const SizedBox(height: 100),
            Container(
              width: context.width,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(shape: BoxShape.circle, color: data.bgcolor!.withOpacity(0.1)),
              child: Container(
                width: context.width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
                child: RippleAnimation(
                  color: data.bgcolor!,
                  delay: const Duration(milliseconds: 300),
                  repeat: false,
                  minRadius: 85,
                  ripplesCount: 6,
                  duration: const Duration(milliseconds: 6 * 300),
                  child: SvgPicture.asset(
                    data.image,
                    height: context.isLandscape ? context.height / 3 : context.height / 3,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    style: title.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: MyColor.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Dimensions.space25 - 1),
                  Text(
                    data.subtitle,
                    style: regularDefault.copyWith(color: MyColor.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
