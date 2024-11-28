import 'package:flutter/material.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';

import 'package:ovolutter/app/components/animations/tween_animation.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/card/demo_card.dart';
import 'package:ovolutter/app/components/card/demo_card_two.dart';
import 'package:ovolutter/app/components/card/general_card.dart';
import 'package:get/get.dart';

class ComponentPreviewScreen extends StatefulWidget {
  const ComponentPreviewScreen({super.key});

  @override
  State<ComponentPreviewScreen> createState() => _ComponentPreviewScreenState();
}

class _ComponentPreviewScreenState extends State<ComponentPreviewScreen> {
  int selectedIndex = -999;
  String label = "Some Label";
  List<String> dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  TextEditingController myController = TextEditingController();
  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: "Components Preview Screen",
          backButtonOnPress: () {
            Get.toNamed(RouteHelper.loginScreen);
          },
          action: [
            // GestureDetector(
            //   onTap: () {
            //     Get.find<ThemeController>().changeTheme();
            //   },
            //   child: Icon(
            //     Get.find<ThemeController>().darkTheme ? CupertinoIcons.moon : CupertinoIcons.sun_min,
            //     color: MyColor.white,
            //   ),
            // ),
            const SizedBox(width: 10)
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: Dimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: theme.cardColor,
                  border: Border.all(color: MyColor.getBorderColor()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TypoGraphy primary",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: MyColor.getBodyTextColor()),
                    ),
                    const SizedBox(height: Dimensions.space10),
                    Text(
                      "TypoGraphy secondary",
                      style: title.copyWith(color: MyColor.getBodyTextColor()),
                    ),
                    const TweenAnimation()
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Column(
                children: List.generate(2, (index) {
                  return GeneralCard();
                }),
              ),
              const SizedBox(height: Dimensions.space20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(20, (index) {
                    return DemoCard();
                  }),
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Column(
                children: List.generate(2, (index) {
                  return DemoCardTwo();
                }),
              ),
            ],
            /*
            children: [
              Center(
                child: Text(
                  "Flutter Prime Components",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  color: theme.cardColor,
                  // boxShadow: MyUtils.getCardShadow(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Animated Textfield",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    CustomCircleAnimatedButton(
                      onTap: () {
                        setState(() {
                          selectedIndex = -1;
                        });
                      },
                      backgroundColor: MyColor.black,
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.arrow_drop_down, color: MyColor.white),
                    )
                  ],
                ),
              ),
              ExpandedSection(
                expand: selectedIndex == -1,
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.space10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                    color: theme.cardColor,
                    border: Border.all(
                      color: MyColor.getBorderColor(),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: Dimensions.space20),
                      AnimatedTextField(
                        onChanged: (v) {},
                        labelText: "Animated Text Field",
                        hintText: "with border",
                        isPassword: true,
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                      ),
                      const SizedBox(height: Dimensions.space30),
                      AnimatedTextField(
                        needOutline: false,
                        onChanged: (v) {},
                        labelText: "Animated Text Field",
                        hintText: "without border",
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                        suffixIcon: const SizedBox(
                          child: Icon(
                            Icons.person,
                            color: MyColor.bodyTextColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                      ),
                      const SizedBox(height: Dimensions.space30),
                      AnimatedTextField(
                        needOutline: true,
                        onChanged: (v) {},
                        labelText: "Animated Text Field",
                        hintText: "without border",
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                        prefixIcon: SizedBox(
                          child: Icon(
                            Icons.lock,
                            color: MyColor.getBodyTextColor(),
                          ),
                        ),
                        isPassword: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                      ),
                      const SizedBox(height: Dimensions.space20),
                      AnimatedTextField(
                        onChanged: (v) {},
                        labelText: "Animated Text Field",
                        hintText: "with border",
                        isPassword: true,
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                        radius: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  color: theme.cardColor,
                  boxShadow: MyUtils.getCardShadow(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Label Textfield",
                      style: boldDefault.copyWith(),
                    ),
                    CustomCircleAnimatedButton(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      backgroundColor: MyColor.black,
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.arrow_drop_down, color: MyColor.white),
                    )
                  ],
                ),
              ),
              ExpandedSection(
                expand: selectedIndex == 0,
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.space10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                    color: theme.cardColor,
                    boxShadow: MyUtils.getCardShadow(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelTextField(
                        onChanged: (v) {},
                        labelText: "Label Text Field",
                        hintText: "with border",
                        isPassword: true,
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                        isRequired: true,
                      ),
                      const SizedBox(height: Dimensions.space20),
                      LabelTextField(
                        onChanged: (v) {},
                        labelText: "Label Text Field",
                        hintText: "with border",
                        isPassword: true,
                        fillColor: MyColor.black.withOpacity(0.1),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                        radius: 10,
                      ),
                      const SizedBox(height: Dimensions.space30),
                      LabelTextField(
                        needOutline: false,
                        onChanged: (v) {},
                        labelText: "Label Text Field",
                        hintText: "without border",
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                      ),
                      const SizedBox(height: Dimensions.space30),
                      LabelTextField(
                        needOutline: true,
                        onChanged: (v) {},
                        labelText: "Label Text Field",
                        hintText: "@me.com",
                        fillColor: MyColor.black.withOpacity(0.07),
                        hintTextColor: MyColor.getBodyTextColor(),
                        labelTextColor: MyColor.black,
                        prefixIcon: SizedBox(
                          child: Icon(
                            Icons.lock,
                            color: MyColor.getBodyTextColor(),
                            size: 16,
                          ),
                        ),
                        isPassword: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
                      ),
                      LabelTextField(
                        // if your project use animated Text field then replace with animated Text filed
                        onChanged: (v) {
                          print(v);
                        },
                        labelText: "Enter your phone number",
                        prefixIcon: SizedBox(
                          width: 55,
                          child: FittedBox(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    CustomBottomSheet(
                                        child: Container(
                                      height: 300,
                                      width: double.infinity,
                                      color: MyColor.appBarColor,
                                    )).customBottomSheet(context);
                                  },
                                  child: Container(
                                    width: 48,
                                    padding: const EdgeInsets.all(Dimensions.space5),
                                    decoration: BoxDecoration(
                                      color: MyColor.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.network("https://flagpedia.net/data/flags/h24/af.webp"),
                                  ),
                                ),
                                const SizedBox(width: Dimensions.space5),
                                Container(
                                  width: 2,
                                  height: 16,
                                  color: MyColor.borderColor,
                                  margin: const EdgeInsets.only(right: Dimensions.space10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              CustomAmountTextField(
                labelText: "Enter your amount",
                hintText: "\$500",
                currency: "\$9",
                onChanged: (v) {},
              ),
              const SizedBox(height: Dimensions.space20),
              const SizedBox(height: Dimensions.space20),
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  color: theme.cardColor,
                  boxShadow: MyUtils.getCardShadow(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Elevated Button",
                      style: boldDefault.copyWith(),
                    ),
                    CustomCircleAnimatedButton(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      backgroundColor: MyColor.black,
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.arrow_drop_down, color: MyColor.white),
                    )
                  ],
                ),
              ),
              ExpandedSection(
                expand: selectedIndex == 1,
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.space10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                    color: theme.cardColor,
                    boxShadow: MyUtils.getCardShadow(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: Dimensions.space20),
                      CustomElevatedBtn(
                        text: "Press me",
                        press: () {},
                        elevation: 10,
                        isLoading: true,
                      ),
                      const SizedBox(height: Dimensions.space15),
                      Center(
                        child: CustomElevatedBtn(
                          text: "Press me",
                          press: () {},
                          elevation: 2,
                          width: 200,
                          height: 45,
                        ),
                      ),
                      const SizedBox(height: Dimensions.space15),
                      CustomElevatedBtn(
                        text: "Download",
                        isLoading: true,
                        icon: const Icon(Icons.download, color: MyColor.white),
                        press: () {},
                        elevation: 0,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space30),
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  color: theme.cardColor,
                  boxShadow: MyUtils.getCardShadow(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rounded Button",
                      style: boldDefault.copyWith(),
                    ),
                    CustomCircleAnimatedButton(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      backgroundColor: MyColor.black,
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.arrow_drop_down, color: MyColor.white),
                    )
                  ],
                ),
              ),
              ExpandedSection(
                expand: selectedIndex == 2,
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.space10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                    color: theme.cardColor,
                    boxShadow: MyUtils.getCardShadow(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: Dimensions.space20),
                      CustomOutlinedBtn(
                        btnText: "Press me",
                        onTap: () {},
                        isLoading: true,
                      ),
                      const SizedBox(height: Dimensions.space15),
                      Center(
                        child: CustomOutlinedBtn(
                          btnText: "Press me",
                          onTap: () {},
                          width: 200,
                          height: 45,
                          radius: 8,
                          textColor: MyColor.black,
                        ),
                      ),
                      const SizedBox(height: Dimensions.space15),
                      CustomOutlinedBtn(
                        btnText: "Download",
                        icon: const Icon(Icons.download, color: MyColor.colorGreen),
                        onTap: () {},
                        width: 200,
                        bgColor: MyColor.colorGreen,
                        borderColor: MyColor.colorRed,
                        textColor: MyColor.colorGreen,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space30),
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  color: theme.cardColor,
                  boxShadow: MyUtils.getCardShadow(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Custom DropDown Button",
                      style: boldDefault.copyWith(),
                    ),
                    CustomCircleAnimatedButton(
                      onTap: () {
                        setState(() {
                          selectedIndex = selectedIndex == 3 ? -999 : 3;
                        });
                      },
                      backgroundColor: MyColor.black,
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.arrow_drop_down, color: MyColor.white),
                    )
                  ],
                ),
              ),
              ExpandedSection(
                expand: selectedIndex == 3,
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.space10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                    color: theme.cardColor,
                    boxShadow: MyUtils.getCardShadow(),
                  ),
                  child: Column(
                    children: [
                      CustomDropDownWithTextField(
                        selectedValue: "Elevated",
                        list: ["Elevated", "Outlined", "Icons", "Inline"],
                        onChanged: (value) {},
                        title: "Selected value",
                      ),
                      const SizedBox(height: Dimensions.space20),
                      CustomDropDownTextField3(
                        selectedValue: "Elevated",
                        items: ["Elevated", "Outlcustom_drop_down_fieldined", "Icons", "Inline"].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: Dimensions.fontDefault,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space10),
            ],
         */
          ),
        ),
      ),
    );
  }
}
