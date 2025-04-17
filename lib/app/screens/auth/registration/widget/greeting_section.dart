import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/environment.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: Dimensions.screenPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.getStartedToday.tr,
                  style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.space35),
                ),
                const SizedBox(height: Dimensions.space8),
                Text(
                  MyStrings.regSubText.tr,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space17.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
