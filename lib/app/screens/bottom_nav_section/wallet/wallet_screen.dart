import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/wallet/widgets/wallet_card_section.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/wallet/wallet_controller.dart';
import 'package:ovolutter/data/repo/wallet/wallet_repo.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    super.key,
  });

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Get.put(WalletRepo());
    final controller = Get.put(WalletController(walletRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<WalletController>(
        builder: (controller) => RefreshIndicator(
            onRefresh: () async {},
            child: MyCustomScaffold(
              showBackButton: false,
              pageTitle: MyStrings.wallet.tr,
              body: Column(
                children: [WalletCardSection()],
              ),
            )));
  }
}
