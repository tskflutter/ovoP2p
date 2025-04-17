import 'package:get/get.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/repo/advertising/advertising_repo.dart';
import 'package:ovolutter/data/repo/my_withdrawals/my_withdrawals_repo.dart';
import 'package:ovolutter/data/repo/wallet_details/wallet_details_repo.dart';

class WalletDetailsController extends GetxController {
  WalletDetailsRepo walletDetailsRepo;

  WalletDetailsController({required this.walletDetailsRepo});

  bool active = true;

  int currentIndex = -1;

  List<String> buySellList = [MyStrings.buy, MyStrings.sell];
  List statusList = [MyStrings.active, MyStrings.inActive];
  List data = [
    "Bank Transfer",
    "PayPal",
    "Stripe",
    "Bkash",
    "Coinbase",
    "Bank Transfer",
    "PayPal",
    "Stripe",
  ];
  changeVisiblityStatus(
    int index,
  ) {
    if (currentIndex == index) {
      active = !active;
    } else {
      currentIndex = index;
      active = true;
    }
    update();
  }
}
