import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class UserBio extends StatefulWidget {
  final String name;

  final String email;
  final TextStyle? nameTextStyle;
  final TextStyle? emailTextStyle;

  const UserBio({super.key, required this.name, required this.email, this.nameTextStyle, this.emailTextStyle});

  @override
  State<UserBio> createState() => _UserBioState();
}

class _UserBioState extends State<UserBio> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 25,
          backgroundImage: NetworkImage("https://wallpapers.com/images/hd/cool-profile-picture-paper-bag-head-4co57dtwk64fb7lv.jpg"),
        ),
        spaceSide(Dimensions.space12.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.name,
            style: widget.nameTextStyle ?? theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space20.sp, fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
          ),
          Text(
            widget.email,
            style: widget.emailTextStyle ?? theme.textTheme.labelSmall?.copyWith(color: MyColor.getBodyTextColor()),
          )
        ])
      ],
    );
  }
}
