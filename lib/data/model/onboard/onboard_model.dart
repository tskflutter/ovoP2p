// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class OnBoardModel {
  String title;
  String subtitle;
  String frontImage;
  String bgImage;
  bool isSvg;
  Color? bgcolor;
  IconData? icon;
  OnBoardModel({
    required this.title,
    required this.subtitle,
    required this.frontImage,
    required this.bgImage,
    required this.isSvg,
    this.bgcolor = MyColor.black,
    this.icon,
  });
}
