import 'package:get/get.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/repo/send/send_repo.dart';

class SendController extends GetxController {
  SendRepo sendRepo;

  SendController({required this.sendRepo});

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
