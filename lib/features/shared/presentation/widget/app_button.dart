import 'package:flutter/material.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_duration.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/color_extension.dart';

enum AppButtonType { outline, normal, primary }

class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
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
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonType = AppButtonType.primary,
    this.borderRadius = 9,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isLongPress = false;

  void _handleLongPress(bool isLongPress) {
    setState(() {
      _isLongPress = isLongPress;
    });
  }

  @override
  Widget build(BuildContext context) {
    final normalBackground = widget.backgroundColor ?? AppColors.greenColor;
    final appButtonConfig = (
      labelStyle: AppTexStyle.textSize16(fontWeight: FontWeight.bold),
      backgroundColor: normalBackground,
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding ?? 20,
        vertical: widget.verticalPadding ?? 16,
      ),
    );

    return GestureDetector(
      onLongPressStart: (details) {
        _handleLongPress(true);
      },
      onLongPressEnd: (details) {
        _handleLongPress(false);
      },
      child: AnimatedContainer(
        duration: AppDuration.to50Milis(),
        curve: Curves.linear,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: appButtonConfig.padding,
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            backgroundBuilder: (context, states, child) {
              Color actualColor =
                  _isLongPress
                      ? normalBackground.toDarker(0.02)
                      : normalBackground;
              if (states.contains(WidgetState.pressed)) {
                print('Pressed');
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: normalBackground.toDarker(0.02),
                  ),
                  child: child,
                );
              }
              return DecoratedBox(
                decoration: BoxDecoration(color: actualColor),
                child: child,
              );
            },
          ),
          onPressed: widget.onPressed,
          child: Text(widget.label, style: appButtonConfig.labelStyle),
        ),
      ),
    );
  }
}
