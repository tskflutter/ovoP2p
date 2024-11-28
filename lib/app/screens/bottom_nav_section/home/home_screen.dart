import 'package:flutter/material.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widget/animated_list.dart';
import 'package:get/get.dart';
import 'package:ovolutter/data/controller/home/home_controller.dart';
import 'package:ovolutter/data/repo/home/home_repo.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widget/main_item_section.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widget/top_section.dart';
import 'widget/kyc_warning_section.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> bottomNavScaffoldKey;
  const HomeScreen({
    super.key,
    required this.bottomNavScaffoldKey,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    
    Get.put(HomeRepo());
    final controller = Get.put(HomeController(homeRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<HomeController>(
      builder: (controller) => WillPopWidget(
        nextRoute: "",
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.initialData(shouldLoad: false);
            await controller.initialData(shouldLoad: false);
            await controller.initialData(shouldLoad: false);
            await controller.initialData(shouldLoad: false);
            await controller.initialData(shouldLoad: false);
            await controller.initialData(shouldLoad: false);
            await controller.initialData(shouldLoad: false);
          },
          child: Scaffold(
            appBar: homeScreenAppBar(
              context,
              controller,
              widget.bottomNavScaffoldKey,
            ),
            body: controller.isLoading
                ? const CustomLoader()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KYCWarningSection(controller: controller),
                        const MainItemSection(),
                        const AnimatedListWidget(),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
