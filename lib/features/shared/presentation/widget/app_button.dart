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
  bool _isLinkPressed = false;

  void _handleLinkPressed() {
    setState(() {
      _isLinkPressed = !_isLinkPressed;
    });
  }

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
      textColor: _isLinkPressed ? AppColors.linkColor : AppColors.blackColor,
    ),
  );

  Color get darkenBackgroundColor =>
      appButtonConfig.backgroundColor.toDarker(0.02);

  Color resolveTextLinkColor(Set<WidgetState> buttonState) {
    if (buttonState.contains(WidgetState.pressed)) {
      return AppColors.linkColor;
    }
    return _isLinkPressed ? AppColors.linkColor : AppColors.blackColor;
  }

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
    return GestureDetector(
      onLongPressStart: (details) {
        state._handleLinkPressed();
      },
      onLongPressEnd: (details) {
        state._handleLinkPressed();
      },
      child: TextButton(
        style: TextButton.styleFrom(
          overlayColor: AppColors.transparent,
          foregroundBuilder: (context, states, child) {
            final dynamicColor = state.resolveTextLinkColor(states);
            return DefaultTextStyle(
              style: AppTexStyle.textSize16(
                textColor: dynamicColor,
                decoration: TextDecoration.underline,
              ),
              child: child!,
            );
          },
        ),
        onPressed: widget.onPressed,
        child: Text(widget.label),
      ),
    );
  }
}
