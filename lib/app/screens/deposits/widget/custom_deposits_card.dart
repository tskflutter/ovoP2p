import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/column_widget/card_column.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/app/screens/withdraw/widget/status_widget.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/util.dart';

class CustomDepositsCard extends StatelessWidget {

  final String trxValue, date,status, amount;
  final Color statusBgColor;
  final VoidCallback onPressed;

  const CustomDepositsCard({
    super.key,
    required this.trxValue,
    required this.date,
    required this.status,
    required this.statusBgColor,
    required this.amount,
    required this.onPressed
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          boxShadow: MyUtils.getCardShadow()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                  header: MyStrings.trxNo,
                  body: trxValue,
                ),
                CardColumn(
                  alignmentEnd: true,
                  header: MyStrings.date,
                 // isDate: true,
                  body: date,
                ),
              ],
            ),
           const CustomDivider(space: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CardColumn(
                  header:MyStrings.amount,
                  body: amount,
                ),
                StatusWidget(
                  status: status,
                  color: statusBgColor,
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
