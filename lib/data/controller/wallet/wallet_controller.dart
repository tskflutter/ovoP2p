import 'package:get/get.dart';
import 'package:ovolutter/data/repo/wallet/wallet_repo.dart';

class WalletController extends GetxController {
  WalletRepo walletRepo;
  WalletController({required this.walletRepo});

  bool isLoading = false;
}
