import 'package:flutter/material.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';

class AppTextField extends StatefulWidget {
  //Value and Controller properties
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  //UI-related properties
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final Color? fillColor;
  //Behavior-related properties
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool? enableSuggestions;
  final bool? autocorrect;
  //Keyboard
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.textStyle,
    this.hintStyle,
    this.decoration,
    this.contentPadding,
    this.filled,
    this.fillColor,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.enableSuggestions,
    this.autocorrect,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.maxLines,
    this.minLines,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldController();
}

//Controller
class _AppTextFieldController extends State<AppTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _AppTextFieldView(this);
  }
}

//View
class _AppTextFieldView
    extends WidgetView<AppTextField, _AppTextFieldController> {
  const _AppTextFieldView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightGreenColor),
        ),
        focusColor: AppColors.greenColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greenColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.mediumGreenColor),
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintStyle: AppTextStyle.textSize16(),
        suffix: widget.suffix,
        prefix: widget.prefix,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(16),
        filled: widget.filled,
        fillColor: widget.fillColor ?? AppColors.whiteColor,
      ),
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
    );
  }
}
