import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/text/label_text.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:get/get.dart';

class CustomDropDownWithTextField extends StatefulWidget {
  final String? title, selectedValue;
  final List<String>? list;
  final ValueChanged? onChanged;
  TextStyle? selectedTextStyle;
  TextStyle? itemTextStyle;
  final double borderWidth;
  final double borderRadious;
  final bool hasBorder;

  CustomDropDownWithTextField({super.key, this.title, this.hasBorder = true, this.selectedValue, this.borderRadious = 5, this.list, this.onChanged, this.itemTextStyle, this.selectedTextStyle, this.borderWidth = 1.0}) : assert(list != null && list.contains(selectedValue), "Selected value must be from the list & list can't be empty");

  @override
  State<CustomDropDownWithTextField> createState() => _CustomDropDownWithTextFieldState();
}

class _CustomDropDownWithTextFieldState extends State<CustomDropDownWithTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    widget.list?.removeWhere((element) => element.isEmpty);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: MyColor.getTransparentColor(),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadious)),
            border: widget.hasBorder
                ? Border.all(
                    color: MyColor.getBorderColor(),
                    width: widget.borderWidth,
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 5, top: 10, bottom: 10),
            child: DropdownButton(
              isExpanded: true,

              underline: Container(),
              hint: Text(
                widget.selectedValue?.tr ?? '',
                style: widget.selectedTextStyle ?? regularDefault.copyWith(color: MyColor.black),
              ), // Not necessary for Option 1
              value: widget.selectedValue,
              dropdownColor: MyColor.lightCardColor2,
              onChanged: widget.onChanged,
              iconEnabledColor: MyColor.getBodyTextColor(),
              items: widget.list!.map(
                (value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Row(
                      children: [
                        Text(
                          value.tr,
                          style: widget.itemTextStyle ?? regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
