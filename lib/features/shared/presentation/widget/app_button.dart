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
  final Color? borderColor;
  final Widget? leadingIcon;
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
    this.borderColor,
    this.leadingIcon,
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
    Color backgroundColor,
    Color borderColor,
    TextStyle labelLinkStyle,
    TextStyle labelStyle,
    EdgeInsets padding,
  })
  get appButtonConfig {
    final isOutline = widget.buttonType == AppButtonType.outline;

    final Color actualBackgroundColor =
        isOutline
            ? AppColors.transparent
            : widget.backgroundColor ?? AppColors.greenColor;

    final Color actualBorderColor =
        isOutline
            ? widget.borderColor ?? AppColors.greenColor
            : AppColors.transparent;

    final EdgeInsets resolvedPadding = EdgeInsets.symmetric(
      horizontal: widget.horizontalPadding ?? 20,
      vertical: widget.verticalPadding ?? 16,
    );

    final TextStyle resolvedLabelStyle = AppTextStyle.textSize16(
      fontWeight: FontWeight.bold,
    );

    final TextStyle resolvedLinkStyle = AppTextStyle.textSize16(
      decoration: TextDecoration.underline,
      textColor: _isLinkPressed ? AppColors.linkColor : AppColors.blackColor,
    );

    return (
      labelStyle: resolvedLabelStyle,
      backgroundColor: actualBackgroundColor,
      padding: resolvedPadding,
      labelLinkStyle: resolvedLinkStyle,
      borderColor: actualBorderColor,
    );
  }

  Color get darkenBackgroundColor =>
      appButtonConfig.backgroundColor.toDarker(0.02);

  Widget resolveOverlayColor(Set<WidgetState> buttonState) {
    if (buttonState.contains(WidgetState.pressed)) {
      return Positioned.fill(child: Container(color: darkenBackgroundColor));
    }
    return SizedBox.shrink();
  }

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
            side: BorderSide(color: config.borderColor, width: 2),
          ),
          overlayColor: AppColors.transparent,
          backgroundBuilder: (context, states, child) {
            return DecoratedBox(
              decoration: BoxDecoration(color: config.backgroundColor),
              child: child,
            );
          },
        ),
        onPressed: widget.onPressed,
        child: SizedBox(
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(widget.label, style: config.labelStyle),
              Builder(
                builder: (context) {
                  if (widget.leadingIcon != null) {
                    return Positioned(left: 0, child: widget.leadingIcon!);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
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
              style: AppTextStyle.textSize16(
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
