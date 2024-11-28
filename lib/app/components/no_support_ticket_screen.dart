import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import '../../core/utils/dimensions.dart';
import 'image/custom_svg_picture.dart';


class NoSupportTicketScreen extends StatefulWidget {

  final String message;
  final double paddingTop;
  final double imageHeight;
  final String message2;
  final String image;

  const NoSupportTicketScreen({
    super.key,
    this.message = MyStrings.noSupportTicket,
    this.paddingTop = 6,
    this.imageHeight = .5,
    this.message2 = MyStrings.noSupportTicketToShow,
    this.image = MyImages.noSupportTicketFound,
  });


  @override
  State<NoSupportTicketScreen> createState() => _NoSupportTicketScreenState();
}

class _NoSupportTicketScreenState extends State<NoSupportTicketScreen> {
  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ListView(
          physics:const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*widget.imageHeight,
                  width:MediaQuery.of(context).size.width*.4,
                  child: CustomSvgPicture(image:widget.image,height: 100,width: 100,color: MyColor.getBorderColor(),),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 6,left: 30,right: 30),
                  child: Column(
                    children: [
                      Text(
                       widget.message.tr,
                        textAlign: TextAlign.center,
                        style:semiBoldDefault.copyWith(
                          color:  MyColor.getBodyTextColor(),
                          fontSize: Dimensions.fontExtraLarge
                        ),
                      ),
                      const SizedBox(height: 5,),
                       Text(widget.message2,style: regularDefault.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.fontLarge),textAlign: TextAlign.center,),
                     
                     ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
