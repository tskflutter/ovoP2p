import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/bottom-nav-bar/custom_bottom_nav.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/model/global/bottom_nav_data_model/bottom_nav_data_model.dart';

import 'package:ovolutter/app/screens/bottom_nav_section/home/home_screen.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widget/home_drawer.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/menu_screen.dart';
import 'package:ovolutter/app/screens/transaction/transactions_screen.dart';
import 'package:ovolutter/app/screens/withdraw/withdraw_history/withdraw_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
    BottomNavItemModel(index: 2, name: MyStrings.withdraw, image: MyImages.withdraw),
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
    return WillPopWidget(
      child: Scaffold(
          key: _scaffoldKey,
          extendBody: true,
          drawer: HomeDrawer(
            key: widget.key,
          ),
          body: screens[currentIndex],
          bottomNavigationBar: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: CutomBttomNavBarWidget(
              items: items,
              onChange: changeScreen,
              bottomNavStyle: BOTTOMNAVSTYLE.STYLE1,
              radius: 50,
              // boxShadow: const [],
              bottomNavBGColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              iconColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
              selectedIconColor: MyColor.getPrimaryColor(),
              selectedItemBGColor: MyColor.getPrimaryColor().withOpacity(0.1),

              showDot: false,
              // radius: Dimensions.mediumRadius,
            ),
          )),
    );
  }
}

class CutomBttomNavBarWidget extends StatefulWidget {
  List<BottomNavItemModel> items;
  Function onChange;
  BOTTOMNAVSTYLE? bottomNavStyle;
  TextStyle? labelStyle;
  Color? iconColor;
  Color? selectedIconColor;
  Color? selectedItemBGColor;
  Color? bottomNavBGColor;
  List<BoxShadow>? boxShadow;
  final bool showDot;
  final double radius;
  CutomBttomNavBarWidget({
    super.key,
    required this.items,
    required this.onChange,
    this.bottomNavStyle = BOTTOMNAVSTYLE.NONE,
    this.labelStyle,
    this.iconColor = MyColor.white,
    this.selectedIconColor = MyColor.black,
    this.selectedItemBGColor,
    this.bottomNavBGColor,
    this.boxShadow,
    this.showDot = false,
    this.radius = Dimensions.mediumRadius,
  })  : assert(items.length < 6 || items.isEmpty, "Items cannot be empty and not more than 5 "),
        assert(BOTTOMNAVSTYLE.STYLE3 != bottomNavStyle, "Bottom nav style3 is under construction");

  @override
  State<CutomBttomNavBarWidget> createState() => _CustomBottomNavBarWidgetState();
}

class _CustomBottomNavBarWidgetState extends State<CutomBttomNavBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    if (widget.bottomNavStyle == BOTTOMNAVSTYLE.STYLE1) {
      return styleOne(context);
    }
    if (widget.bottomNavStyle == BOTTOMNAVSTYLE.STYLE2) {
      return styleTwo(context);
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.bottomNavBGColor ?? Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = widget.items[index].index;
                  widget.onChange(currentIndex);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: widget.selectedItemBGColor ?? MyColor.getTransparentColor(),
                  borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.items[index].isIconData == true) ...[
                      Icon(widget.items[index].icon)
                    ] else ...[
                      widget.items[index].image.contains('svg')
                          ? SvgPicture.asset(
                              widget.items[index].image,
                              colorFilter: ColorFilter.mode(
                                widget.items[index].index == currentIndex ? widget.selectedIconColor! : widget.iconColor!,
                                BlendMode.srcIn,
                              ),
                              width: 16,
                              height: 16,
                            )
                          : Image.asset(
                              widget.items[index].image,
                              color: widget.items[index].index == currentIndex ? widget.selectedIconColor : widget.iconColor,
                              width: 16,
                              height: 16,
                            ),
                    ],
                    if (widget.items[index].index == currentIndex) ...[
                      const SizedBox(height: Dimensions.space10 / 2),
                      Text(
                        widget.items[index].name.tr,
                        textAlign: TextAlign.center,
                        style: widget.labelStyle ?? regularSmall.copyWith(color: widget.items[index].index == currentIndex ? widget.selectedIconColor : MyColor.getBodyTextColor()),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Container styleTwo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.bottomNavBGColor ?? Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        boxShadow: widget.boxShadow ?? [BoxShadow(color: MyColor.getBorderColor(), offset: Offset(-2, -2), blurRadius: 2)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          widget.items.length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = widget.items[index].index;
                widget.onChange(currentIndex);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: MyColor.getTransparentColor(),
                borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Dimensions.space8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.selectedItemBGColor ?? MyColor.white.withOpacity(0.1),
                    ),
                    child: widget.items[index].isIconData == true
                        ? Icon(widget.items[index].icon)
                        : widget.items[index].image.contains('svg')
                            ? SvgPicture.asset(
                                widget.items[index].image,
                                colorFilter: ColorFilter.mode(
                                  widget.items[index].index == currentIndex ? widget.selectedIconColor! : widget.iconColor!,
                                  BlendMode.srcIn,
                                ),
                                width: 16,
                                height: 16,
                              )
                            : Image.asset(
                                widget.items[index].image,
                                color: widget.items[index].index == currentIndex ? widget.selectedIconColor : widget.iconColor,
                                width: 16,
                                height: 16,
                              ),
                  ),
                  const SizedBox(height: Dimensions.space5),
                  if (widget.items[index].index == currentIndex) ...[
                    widget.showDot
                        ? Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.selectedIconColor,
                            ),
                          )
                        : Text(
                            widget.items[index].name.tr,
                            textAlign: TextAlign.center,
                            style: widget.labelStyle ?? regularSmall.copyWith(color: widget.items[index].index == currentIndex ? widget.selectedIconColor : widget.iconColor),
                          ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container styleOne(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space10),
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.bottomNavBGColor ?? Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        // borderRadius: BorderRadius.circular(widget.radius),
        boxShadow: widget.boxShadow ?? [BoxShadow(color: MyColor.getBorderColor(), offset: Offset(-2, -2), blurRadius: 2)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          widget.items.length,
          (index) => InkWell(
            onTap: () {
              currentIndex = widget.items[index].index;
              setState(() {});
              widget.onChange(currentIndex);
            },
            child: AnimatedContainer(
              duration: const Duration(microseconds: 500),
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space8),
              decoration: BoxDecoration(
                color: currentIndex == widget.items[index].index ? (widget.selectedItemBGColor ?? MyColor.getPrimaryColor()) : MyColor.getTransparentColor(),
                borderRadius: BorderRadius.circular(Dimensions.extraRadius),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.items[index].isIconData == true) ...[
                    Icon(widget.items[index].icon)
                  ] else ...[
                    widget.items[index].image.contains('svg')
                        ? SvgPicture.asset(
                            widget.items[index].image,
                            colorFilter: ColorFilter.mode(
                              widget.items[index].index == currentIndex ? widget.selectedIconColor! : widget.iconColor!,
                              BlendMode.srcIn,
                            ),
                            width: 16,
                            height: 16,
                          )
                        : Image.asset(
                            widget.items[index].image,
                            color: widget.items[index].index == currentIndex ? widget.selectedIconColor : widget.iconColor,
                            width: 16,
                            height: 16,
                          ),
                  ],
                  if (widget.items[index].index == currentIndex) ...[
                    const SizedBox(width: Dimensions.space10 / 2),
                    Text(
                      widget.items[index].name.tr,
                      textAlign: TextAlign.center,
                      style: widget.labelStyle ?? regularSmall.copyWith(color: widget.items[index].index == currentIndex ? widget.selectedIconColor : MyColor.getBodyTextColor()),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
