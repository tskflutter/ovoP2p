import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/my_color.dart';
import '../../../../../../core/utils/my_images.dart';
import '../../../../../../core/utils/my_strings.dart';
import '../../../../../../core/utils/style.dart';

class EnableQRCodeWidget extends StatelessWidget {
  final String qrImage;
  final String secret;
  const EnableQRCodeWidget({super.key, required this.qrImage, required this.secret});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(Dimensions.space30),
            decoration: BoxDecoration(
              color: MyColor.lightTwoFaCardColor,
              borderRadius: BorderRadius.circular(Dimensions.space20),
            ),
            child: Image.network(qrImage, width: 220, height: 220, errorBuilder: (ctx, object, trx) {
              return Image.asset(
                MyImages.placeHolderImage,
                fit: BoxFit.cover,
                width: 220,
                height: 220,
              );
            }),
          ),
        ),

        //COPY

        const SizedBox(height: Dimensions.space15),
        Row(
          children: [
            Expanded(
                child: Divider(
              color: MyColor.getBorderColor(),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                MyStrings.orEnterCodeManually.tr,
                style: theme.textTheme.labelLarge?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
              ),
            ),
            Expanded(
                child: Divider(
              color: MyColor.getBorderColor(),
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
                child: Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), color: MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space12)),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space14, vertical: Dimensions.space12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            secret,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: Dimensions.space15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(
                  text: secret,
                )).then((_) {
                  CustomSnackBar.success(successList: [MyStrings.copiedToClipBoard.tr], duration: 2);
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: Dimensions.space5.w),
                padding: EdgeInsets.all(Dimensions.space12),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), color: MyColor.lightTwoFaCardColor),
                child: MyAssetImageWidget(
                  assetPath: MyImages.copyCode,
                  isSvg: true,
                  height: Dimensions.space24.h,
                  width: Dimensions.space24.h,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
