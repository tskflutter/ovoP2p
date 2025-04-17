import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/available_trade_card.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/trade/widget/running_trade_card.dart';
import 'package:ovolutter/core/utils/app_style.dart' show spaceDown;
import 'package:ovolutter/core/utils/util_exporter.dart' show Dimensions, SizeExtension;
import 'package:ovolutter/data/controller/trade/trade_controller.dart';
import 'package:show_up_animation/show_up_animation.dart';

class RunningTradeSection extends StatefulWidget {
  const RunningTradeSection({super.key});

  @override
  State<RunningTradeSection> createState() => _RunningTradeSectionState();
}

class _RunningTradeSectionState extends State<RunningTradeSection> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TradeController>(
      builder: (controller) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.verticalScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowUpAnimation(
                // key: ValueKey(controller.isBuy),
                // direction: controller.isBuy ? Direction.horizontal : Direction.vertical,
                // curve: controller.isBuy ? Curves.decelerate : Curves.easeInOut,
                child: RunningTradeCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
