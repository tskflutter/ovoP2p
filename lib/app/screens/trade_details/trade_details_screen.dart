import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/screens/trade_details/widgets/exchange_section.dart';
import 'package:ovolutter/app/screens/trade_details/widgets/payment_method_bottom_sheet.dart';
import 'package:ovolutter/app/screens/trade_details/widgets/top_section.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/trade_details/trade_details_controller.dart';
import 'package:ovolutter/data/repo/trade_details/trade_details_repo.dart';

class TradeDetailsScreen extends StatefulWidget {
  const TradeDetailsScreen({super.key});

  @override
  State<TradeDetailsScreen> createState() => _TradeDetailsScreenState();
}

class _TradeDetailsScreenState extends State<TradeDetailsScreen> {
  @override
  void initState() {
    Get.put(TradeDetailsRepo());
    final controller = Get.put(TradeDetailsController(tradeDetailsRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MyCustomScaffold(
      pageTitle: MyStrings.tradeDetails.tr,
      body: GetBuilder<TradeDetailsController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              TopSection(),
              spaceDown(Dimensions.space24.h),
              ExchangeSection(),
              spaceDown(Dimensions.space16.h),
              LabelTextField(
                labelText: MyStrings.email.tr,
                hintText: MyStrings.setMyPaymentMethod.tr,
                onChanged: (value) {},
                fillColor: MyColor.getTransparentColor(),
                hideLabel: true,
                readOnly: true,
                inputTextStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getBodyTextColor()),
                labelTextStyle: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getBodyTextColor()),
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                onTap: () {
                  PaymentMethodBottomsheet.paymentMethodBottomsheet(context);
                },
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(Dimensions.space12),
                  child: MyAssetImageWidget(
                    assetPath: MyImages.arrowforwardIos,
                    isSvg: true,
                    height: Dimensions.space16.h,
                    width: Dimensions.space16.h,
                  ),
                ),
                radius: Dimensions.largeRadius,
                validator: (value) {
                  if (value!.isEmpty) {
                    return MyStrings.fieldErrorMsg.tr;
                  } else {
                    return null;
                  }
                },
              ),
              spaceDown(Dimensions.space24.h),
              CustomElevatedBtn(
                onTap: () {
                  Get.toNamed(RouteHelper.tradePaymentAndChatScreen);
                },
                text: "Buy ETH",
                bgColor: MyColor.getSuccessColor(),
                hasGradiant: false,
              ),
              spaceDown(Dimensions.space24.h),
              Container(
                padding: EdgeInsets.all(Dimensions.space12),
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12.sp), border: Border.all(color: MyColor.getBorderColor())),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyStrings.adsTerms.tr,
                      style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space15.sp),
                    ),
                    spaceDown(Dimensions.space8.h),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(
                          "• Misrepresentation of payment methods or terms.",
                          style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomCurveDarkShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0F172A) // Dark blue color from the SVG
      ..style = PaintingStyle.fill;

    final path = Path();

    // Following the exact path from the SVG
    // Start from top right with rounded corner
    path.moveTo(size.width, size.height * 12 / 150);

    // Top right curve
    path.quadraticBezierTo(size.width, 0, size.width - size.width * 12 / 343, 0);

    // Top edge
    path.lineTo(size.width * 12 / 343, 0);

    // Top left curve
    path.quadraticBezierTo(0, 0, 0, size.height * 12 / 150);

    // Left edge
    path.lineTo(0, size.height * 138 / 150);

    // Bottom left curve
    path.quadraticBezierTo(0, size.height, size.width * 12 / 343, size.height);

    // Bottom left segment to the curve start
    path.lineTo(size.width * 125.473 / 343, size.height);

    // The bottom arc indent part - calculated based on SVG path
    path.cubicTo(size.width * 131.59 / 343, size.height, size.width * 136.533 / 343, size.height * 145.261 / 150, size.width * 138.973 / 343, size.height * 139.652 / 150);

    path.cubicTo(size.width * 144.516 / 343, size.height * 126.91 / 150, size.width * 157.218 / 343, size.height * 118 / 150, size.width * 172 / 343, size.height * 118 / 150);

    path.cubicTo(size.width * 186.782 / 343, size.height * 118 / 150, size.width * 199.484 / 343, size.height * 126.91 / 150, size.width * 205.027 / 343, size.height * 139.652 / 150);

    path.cubicTo(size.width * 207.467 / 343, size.height * 145.261 / 150, size.width * 212.41 / 343, size.height, size.width * 218.527 / 343, size.height);

    // Bottom right segment
    path.lineTo(size.width * 331 / 343, size.height);

    // Bottom right curve
    path.quadraticBezierTo(size.width, size.height, size.width, size.height * 138 / 150);

    // Right edge back to start
    path.lineTo(size.width, size.height * 12 / 150);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TopCurveDarkShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0F172A) // Dark blue color from the SVG
      ..style = PaintingStyle.fill;

    final path = Path();

    // Following the exact path from the SVG with curve at the top
    // Start from bottom right with rounded corner
    path.moveTo(size.width, size.height * 138 / 150);

    // Bottom right curve
    path.quadraticBezierTo(size.width, size.height, size.width - size.width * 12 / 343, size.height);

    // Bottom edge
    path.lineTo(size.width * 12 / 343, size.height);

    // Bottom left curve
    path.quadraticBezierTo(0, size.height, 0, size.height * 138 / 150);

    // Left edge
    path.lineTo(0, size.height * 12 / 150);

    // Top left curve
    path.quadraticBezierTo(0, 0, size.width * 12 / 343, 0);

    // Top left segment to the curve start
    path.lineTo(size.width * 125.473 / 343, 0);

    // The top arc curve part - calculated based on SVG path
    path.cubicTo(size.width * 131.59 / 343, 0, size.width * 136.533 / 343, size.height * 4.73857 / 150, size.width * 138.973 / 343, size.height * 10.3479 / 150);

    path.cubicTo(size.width * 144.516 / 343, size.height * 23.0902 / 150, size.width * 157.218 / 343, size.height * 32 / 150, size.width * 172 / 343, size.height * 32 / 150);

    path.cubicTo(size.width * 186.782 / 343, size.height * 32 / 150, size.width * 199.484 / 343, size.height * 23.0902 / 150, size.width * 205.027 / 343, size.height * 10.3479 / 150);

    path.cubicTo(size.width * 207.467 / 343, size.height * 4.73857 / 150, size.width * 212.41 / 343, 0, size.width * 218.527 / 343, 0);

    // Top right segment
    path.lineTo(size.width * 331 / 343, 0);

    // Top right curve
    path.quadraticBezierTo(size.width, 0, size.width, size.height * 12 / 150);

    // Right edge back to start
    path.lineTo(size.width, size.height * 138 / 150);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
