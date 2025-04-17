import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:ovolutter/app/components/column_widget/bottom_sheet_column.dart';
import 'package:ovolutter/app/components/custom_container/bottom_sheet_container.dart';
import 'package:ovolutter/app/components/row_widget/bottom_sheet_top_row.dart';
import 'package:ovolutter/core/helper/string_format_helper.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/home/home_controller.dart';

class CurrencySelectionBottomsheet {
  static void currencySelectionBottomsheet(
    BuildContext context,
  ) {
    CustomBottomSheet(
      bgColor: MyColor.pcBackground,
      child: GetBuilder<HomeController>(
          builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomSheetTopRow(header: MyStrings.currency.tr),
                ],
              )),
    ).customBottomSheet(context);
  }
}
