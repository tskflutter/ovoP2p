import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class RoundedTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool forceShowSuffixDesign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? labelFillColor;
  final Color? focusBorderColor;
  final String? Function(String?)? validator;
  final InputBorderType borderType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool showLabelText;
  final int maxLine;
  final String? instructions;

  const RoundedTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.isRequired = false,
    this.focusNode,
    this.nextFocus,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.forceShowSuffixDesign = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = MyColor.white,
    this.labelFillColor = MyColor.pcBackground,
    this.focusBorderColor,
    this.validator,
    this.borderType = InputBorderType.outline, // default border type
    this.maxLength,
    this.textInputAction,
    this.textStyle,
    this.hintStyle,
    this.textInputFormatter,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.contentPadding,
    this.readOnly = false,
    this.showLabelText = true,
    this.maxLine = 1,
    this.instructions,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool hidePassword = true;
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          readOnly: widget.readOnly,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? hidePassword : false,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.textInputFormatter,
          maxLines: widget.maxLine,
          cursorColor: MyColor.getBodyTextColor(),
          style: widget.textStyle ?? theme.textTheme.bodyMedium?.copyWith(color: MyColor.getHeadingTextColor()),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,

            floatingLabelStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
            contentPadding: widget.contentPadding ?? EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space20.sp, vertical: 20.sp),
            // labelText: widget.showLabelText ? widget.labelText : null,
            labelStyle: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
            hintText: widget.hintText.tr,
            hintStyle: widget.hintStyle ?? theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor().withValues(alpha: 0.8)),
            prefixIcon: widget.prefixIcon,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            // suffixIcon: suffixIcon,
            suffixIcon: widget.isPassword && widget.forceShowSuffixDesign == false
                ? UnconstrainedBox(
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: IconButton(
                        focusColor: MyColor.getBorderColor().withValues(alpha: 0.01),
                        autofocus: false,
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword == true ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                          color: MyColor.getBodyTextColor().withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  )
                : widget.suffixIcon,
            filled: true,
            fillColor: widget.fillColor,
            border: _getInputBorder(),
            enabledBorder: _getInputBorder(),
            focusedBorder: _getInputBorder(isFocused: true, color: widget.focusBorderColor),
            errorBorder: _getInputBorder(isError: true),
            focusedErrorBorder: _getInputBorder(isFocused: true, isError: true),
          ),
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted ?? (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus) : null,
          onChanged: (text) {
            if (widget.onChanged != null) {
              widget.onChanged!(text);
            }
          },
          onTap: widget.onTap,
        ),
        PositionedDirectional(
            top: -9,
            start: 15,
            child: widget.showLabelText
                ? Container(
                    color: widget.labelFillColor,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space5),
                    child: Row(
                      children: [
                        Text(
                          widget.labelText.tr,
                          style: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
                        ),
                        if (widget.instructions != null) ...[
                          spaceSide(Dimensions.space5),
                          Tooltip(
                            onTriggered: () {},
                            key: _tooltipKey,
                            message: "${widget.instructions?.tr}",
                            child: InkWell(
                              onTap: () {
                                _tooltipKey.currentState?.ensureTooltipVisible();
                              },
                              child: Icon(
                                Icons.info_outline_rounded,
                                size: Dimensions.space18,
                                color: MyColor.getBodyTextColor(),
                              ),
                            ),
                          ),
                        ],
                        if (widget.isRequired) ...[
                          spaceSide(Dimensions.space5),
                          Text(
                            "*",
                            style: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getErrorColor()),
                          ),
                        ],
                      ],
                    ),
                  )
                : SizedBox())
      ],
    );
  }

  // Helper method to get the InputBorder based on the type
  InputBorder _getInputBorder({bool isFocused = false, bool isError = false, Color? color}) {
    switch (widget.borderType) {
      case InputBorderType.outline:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.largeRadius.r),
          borderSide: BorderSide(
            color: isError
                ? MyColor.getErrorColor()
                : isFocused
                    ? color ?? MyColor.getBorderColor()
                    : MyColor.getBorderColor(),
            width: 1,
          ),
        );
      case InputBorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: isError
                ? MyColor.getErrorColor()
                : isFocused
                    ? MyColor.getBorderColor()
                    : MyColor.getBorderColor(),
            width: 1,
          ),
        );
      case InputBorderType.none:
        return InputBorder.none;
      default:
        return const OutlineInputBorder();
    }
  }
}

// Enum for border types
enum InputBorderType { outline, underline, none }
