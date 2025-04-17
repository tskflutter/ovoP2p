import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/model/onboard/onboard_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnBoardBody extends StatelessWidget {
  OnBoardModel data;
  OnBoardBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            data.title,
            style: title.copyWith(fontSize: 24, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimensions.space25 - 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Text(
              data.subtitle,
              style: regularDefault.copyWith(color: const Color(0xff2D2B2E)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
