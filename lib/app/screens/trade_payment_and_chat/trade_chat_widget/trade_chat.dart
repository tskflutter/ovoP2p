import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/user_data.dart';
import 'package:ovolutter/app/screens/trade_details/widgets/top_section.dart';
import 'package:ovolutter/app/screens/trade_payment_and_chat/trade_payment_widgets/stepper_section.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/trade_details_and_chat/trade_details_and_chat_controller.dart';

class TradeChat extends StatefulWidget {
  const TradeChat({super.key});

  @override
  State<TradeChat> createState() => _TradeChatState();
}

class _TradeChatState extends State<TradeChat> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TradeDetailsAndChatController>(
        builder: (controller) => SingleChildScrollView(
              child: Column(
                children: [
                  Container(padding: EdgeInsets.all(Dimensions.space16.sp), decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), color: MyColor.pcBackground), child: TopSection()),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.steplist.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    itemBuilder: (context, index) {
                      final item = controller.steplist[index];
                      final isSender = item["sender"] == "1";

                      return Align(
                        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                          decoration: BoxDecoration(
                            color: isSender ? MyColor.textSenderbgColor : MyColor.pcBackground,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(12),
                              topRight: const Radius.circular(12),
                              bottomLeft: Radius.circular(isSender ? 12 : 0),
                              bottomRight: Radius.circular(isSender ? 0 : 12),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["message"].toString(),
                                style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["timestamp"].toString(),
                                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ));
  }
}
