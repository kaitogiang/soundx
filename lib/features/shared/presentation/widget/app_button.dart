import 'package:flutter/material.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/color_extension.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';

import '../../../../core/constants/app_duration.dart';

enum AppButtonType { outline, normal, primary, link }

//Passed properties to the widget
class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final String label;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final AppButtonType? buttonType;
  final double borderRadius;
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPressed,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonType = AppButtonType.primary,
    this.borderRadius = 9,
  });

  @override
  State<AppButton> createState() => _AppButtonController();
}

//Separate logic only
class _AppButtonController extends State<AppButton> {
  // Configuration for the button, computed once for efficiency
  ({
    TextStyle labelStyle,
    Color backgroundColor,
    EdgeInsets padding,
    TextStyle labelLinkStyle,
  })
  get appButtonConfig => (
    labelStyle: AppTexStyle.textSize16(fontWeight: FontWeight.bold),
    backgroundColor: widget.backgroundColor ?? AppColors.greenColor,
    padding: EdgeInsets.symmetric(
      horizontal: widget.horizontalPadding ?? 20,
      vertical: widget.verticalPadding ?? 16,
    ),
    labelLinkStyle: AppTexStyle.textSize16(
      decoration: TextDecoration.underline,
    ),
  );

  Color get darkenBackgroundColor =>
      appButtonConfig.backgroundColor.toDarker(0.02);

  @override
  Widget build(BuildContext context) {
    if (widget.buttonType == AppButtonType.link) {
      return _AppButtonLink(this);
    }
    return _AppButtonView(this);
  }
}

//Separate UI only
class _AppButtonView extends WidgetView<AppButton, _AppButtonController> {
  const _AppButtonView(super.state, {super.key});
  @override
  Widget build(BuildContext context) {
    final config = state.appButtonConfig;

    return AnimatedContainer(
      duration: AppDuration.to50Milis(),
      curve: Curves.linear,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: config.padding,
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          overlayColor: state.darkenBackgroundColor,
          backgroundBuilder: (context, states, child) {
            if (states.contains(WidgetState.pressed)) {
              return DecoratedBox(
                decoration: BoxDecoration(color: state.darkenBackgroundColor),
                child: child,
              );
            }
            return DecoratedBox(
              decoration: BoxDecoration(color: config.backgroundColor),
              child: child,
            );
          },
        ),
        onPressed: widget.onPressed,
        child: Text(widget.label, style: config.labelStyle),
      ),
    );
  }
}

class _AppButtonLink extends WidgetView<AppButton, _AppButtonController> {
  const _AppButtonLink(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final config = state.appButtonConfig;
    return TextButton(
      style: TextButton.styleFrom(overlayColor: AppColors.transparent),
      onPressed: widget.onPressed,
      child: Text(widget.label, style: config.labelLinkStyle),
    );
  }
}
