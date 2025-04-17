import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/data/controller/onboard/onboard_controller.dart';
import 'package:ovolutter/data/model/onboard/onboard_model.dart';
import 'package:show_up_animation/show_up_animation.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        controller.currentIndex == 0
            ? ShowUpAnimation(
                delayStart: Duration(milliseconds: 600),
                animationDuration: Duration(milliseconds: 600),
                curve: Curves.easeInCubic,
                direction: Direction.horizontal,
                offset: -0.5,
                child: MyAssetImageWidget(height: height, width: width, assetPath: data.bgImage),
              )
            : controller.currentIndex == 1
                ? ShowUpAnimation(
                    delayStart: Duration(milliseconds: 600),
                    animationDuration: Duration(milliseconds: 1600),
                    curve: Curves.easeInCubic,
                    direction: Direction.vertical,
                    offset: 0.5,
                    child: MyAssetImageWidget(height: height, width: width, assetPath: data.bgImage),
                  )
                : controller.currentIndex == 2
                    ? ShowUpAnimation(
                        delayStart: Duration(milliseconds: 600),
                        animationDuration: Duration(milliseconds: 1600),
                        curve: Curves.linear,
                        direction: Direction.vertical,
                        offset: 0.5,
                        child: MyAssetImageWidget(height: height, width: width, assetPath: data.bgImage),
                      )
                    : SizedBox(),
        controller.currentIndex == 0
            ? Positioned(
                right: 0,
                left: 0,
                top: 0,
                child: ShowUpAnimation(
                  delayStart: Duration(milliseconds: 600),
                  animationDuration: Duration(milliseconds: 1600),
                  curve: Curves.linear,
                  direction: Direction.vertical,
                  offset: 0.5,
                  child: MyAssetImageWidget(height: height * .55, boxFit: BoxFit.cover, assetPath: data.frontImage),
                ),
              )
            : controller.currentIndex == 1
                ? Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: MyAssetImageWidget(
                      height: height * .6,
                      boxFit: BoxFit.cover,
                      assetPath: data.frontImage,
                      isSvg: true,
                    ),
                  )
                : controller.currentIndex == 2
                    ? Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        child: ShowUpAnimation(
                          delayStart: Duration(milliseconds: 600),
                          animationDuration: Duration(milliseconds: 1600),
                          curve: Curves.linear,
                          direction: Direction.vertical,
                          offset: 0.5,
                          child: MyAssetImageWidget(
                            height: height * .55,
                            boxFit: BoxFit.contain,
                            assetPath: data.frontImage,
                            isSvg: true,
                          ),
                        ),
                      )
                    : SizedBox(),
        SizedBox(height: context.height * 0.1),
        const SizedBox(height: 20),
      ],
    );
  }
}
