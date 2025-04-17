import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/core/helper/date_converter.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_icons.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/url_container.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/data/controller/support/ticket_details_controller.dart';
import 'package:ovolutter/app/components/image/custom_svg_picture.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../../data/model/support/support_ticket_view_response_model.dart';

class TicketListItem extends StatelessWidget {
  const TicketListItem({super.key, required this.index, required this.messages});

  final SupportMessage messages;
  final int index;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TicketDetailsController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.all(Dimensions.space10),
              margin: const EdgeInsets.only(bottom: Dimensions.space15),
              decoration: BoxDecoration(
                color: messages.adminId == "1" ? MyColor.getWarningColor().withOpacity(0.1) : MyColor.pcBackground,
                borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
                border: Border.all(
                  color: messages.adminId == "1" ? MyColor.getWarningColor() : MyColor.getBorderColor(),
                  strokeAlign: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: ClipOval(
                          child: Image.asset(
                            messages.adminId == "1" ? MyImages.admin : MyImages.profile,
                            height: 45,
                            width: 45,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (messages.admin == null)
                                Text(
                                  '${messages.ticket?.name}',
                                  style: boldDefault.copyWith(color: MyColor.getBodyTextColor()),
                                )
                              else
                                Text(
                                  '${messages.admin?.name}',
                                  style: boldDefault.copyWith(color: MyColor.getBodyTextColor()),
                                ),
                              Text(
                                messages.adminId == "1" ? MyStrings.admin.tr : MyStrings.you.tr,
                                style: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            DateConverter.getFormatedSubtractTime(messages.createdAt ?? ''),
                            style: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                          ),
                          child: Text(
                            messages.message ?? "",
                            style: regularDefault.copyWith(
                              color: MyColor.getBodyTextColor(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (messages.attachments?.isNotEmpty ?? false)
                    Container(
                      height: MediaQuery.of(context).size.width > 500 ? 100 : 100,
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10, vertical: Dimensions.space5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: messages.attachments != null
                              ? List.generate(
                                  messages.attachments!.length,
                                  (i) => controller.selectedIndex == i
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30, vertical: Dimensions.space10),
                                          decoration: BoxDecoration(
                                            color: MyColor.getScaffoldBackgroundColor(),
                                            borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
                                          ),
                                          child: SpinKitThreeBounce(
                                            size: 20.0,
                                            color: MyColor.getPrimaryColor(),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            String url = '${UrlContainer.supportImagePath}${messages.attachments?[i].attachment}';
                                            String ext = messages.attachments?[i].attachment!.split('.')[1] ?? 'pdf';
                                            if (MyUtils.isImage(messages.attachments?[i].attachment.toString() ?? "")) {
                                              // Get.toNamed(
                                              //   RouteHelper.previewImageScreen,
                                              //   arguments: "${UrlContainer.supportImagePath}${messages.attachments?[i].attachment}",
                                              // );
                                              controller.downloadAttachment(url, messages.attachments?[i].id ?? -1, ext);
                                            } else {
                                              controller.downloadAttachment(url, messages.attachments?[i].id ?? -1, ext);
                                            }
                                          },
                                          child: Container(
                                              width: MediaQuery.of(context).size.width > 500 ? 100 : 100,
                                              height: MediaQuery.of(context).size.width > 500 ? 100 : 100,
                                              margin: const EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: MyColor.getBorderColor()),
                                                borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
                                              ),
                                              child: MyUtils.isImage(messages.attachments?[i].attachment.toString() ?? "")
                                                  ? MyNetworkImageWidget(
                                                      imageUrl: "${UrlContainer.supportImagePath}${messages.attachments?[i].attachment}",
                                                      width: MediaQuery.of(context).size.width > 500 ? 100 : 100,
                                                      height: MediaQuery.of(context).size.width > 500 ? 100 : 100,
                                                    )
                                                  : MyUtils.isDoc(messages.attachments?[i].attachment.toString() ?? "")
                                                      ? const Center(
                                                          child: CustomSvgPicture(
                                                            image: MyIcons.doc,
                                                            height: 45,
                                                            width: 45,
                                                          ),
                                                        )
                                                      : const Center(
                                                          child: CustomSvgPicture(
                                                            image: MyIcons.pdfFile,
                                                            height: 45,
                                                            width: 45,
                                                          ),
                                                        )),
                                        ),
                                )
                              : const [SizedBox.shrink()],
                        ),
                      ),
                    ),
                ],
              ),
            ));
  }
}
//
