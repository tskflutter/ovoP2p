import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/bottom-nav-bar/custom_bottom_nav.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/menu_screen.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/model/global/bottom_nav_data_model/bottom_nav_data_model.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/home_screen.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widget/market_filter_drawer.dart';
import 'package:ovolutter/app/screens/transaction/transactions_screen.dart';
import 'package:ovolutter/app/screens/withdraw/withdraw_history/withdraw_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> screens = [];

  int currentIndex = 0;
  List<BottomNavItemModel> items = [
    BottomNavItemModel(index: 0, name: MyStrings.home, image: MyImages.home),
    BottomNavItemModel(index: 1, name: MyStrings.transaction, image: MyImages.transaction),
    BottomNavItemModel(index: 2, name: MyStrings.withdrawals, image: MyImages.withdraw),
    BottomNavItemModel(index: 3, name: MyStrings.menu, image: MyImages.bottomMenu),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [HomeScreen(bottomNavScaffoldKey: _scaffoldKey), const TransactionsScreen(), const WithdrawScreen(), const MenuScreen()];
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        drawer: MarketFilterDrawer(
          key: widget.key,
        ),
        body: screens[currentIndex],
        bottomNavigationBar: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: CustomBottomNavBar(
            items: items,
            onChange: changeScreen,
            bottomNavStyle: BOTTOMNAVSTYLE.STYLE1,
            radius: 50,
            // boxShadow: const [],
            bottomNavBGColor: MyColor.pcBackground,
            iconColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            selectedIconColor: MyColor.getPrimaryColor(),
            selectedItemBGColor: MyColor.getPrimaryColor().withValues(alpha: .1),
            showDot: false,
          ),
        ));
  }
}
