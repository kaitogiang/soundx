import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/color_extension.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';
import 'package:soundx/soundx.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key, this.onSelect});

  final void Function(Locale)? onSelect;

  @override
  State<LanguageButton> createState() => _LanguageButtonController();
}

class _LanguageButtonController extends State<LanguageButton>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _animationController;
  late Completer<void> _animationCompleter;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _animationCompleter = Completer();
      } else if (status == AnimationStatus.dismissed) {
        _animationCompleter.complete();
      }
    });
  }

  void showLanguageSelector() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Animate(
          effects: [FadeEffect()],
          controller: _animationController,
          child: _LanguageButtonView(this).languageSelectorView(context),
        );
      },
    );
    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() async {
    _animationController.reverse();
    await _animationCompleter.future;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return _LanguageButtonView(this);
  }
}

class _LanguageButtonView
    extends WidgetView<LanguageButton, _LanguageButtonController> {
  const _LanguageButtonView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.showLanguageSelector();
      },
      child: CompositedTransformTarget(
        link: state._layerLink,
        child: CircleAvatar(radius: 12, child: AppAssets.pngUkFlag.image()),
      ),
    );
  }

  Widget languageSelectorView(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              state._removeOverlay();
            },
            child: Container(
              color: Colors.transparent, // dùng để nhận sự kiện tap ra ngoài
            ),
          ),
          CompositedTransformFollower(
            link: state._layerLink,
            targetAnchor: Alignment.bottomRight,
            followerAnchor: Alignment.topLeft,
            child: Material(
              color: AppColors.whiteColor,
              borderRadius: AppSizes.s8.allBorderRadius,
              child: Padding(
                padding: AppSizes.s8.allPadding,
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        AppTranslate.delegate.supportedLocales.map<Widget>((
                          item,
                        ) {
                          return _buildLanguageItem(
                            context: context,
                            locale: item,
                            onChange: (value) {
                              widget.onSelect?.call(value);
                              state._removeOverlay();
                            },
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ({String languageName, Widget icon}) _mapToLanguageInfo(
    BuildContext context,
    String languageCode,
  ) {
    final language = context.tr;
    return switch (languageCode) {
      'en' => (
        languageName: language.englishLanguage,
        icon: AppAssets.pngUkFlag.image(width: 24),
      ),
      'vi' => (
        languageName: language.vietnameseLanguage,
        icon: AppAssets.pngVietnamFlag.image(width: 24),
      ),
      _ => (languageName: 'Unknown', icon: SizedBox.shrink()), // Fallback case
    };
  }

  Widget _buildLanguageItem({
    required BuildContext context,
    required Locale locale,
    required Function(Locale) onChange,
  }) {
    final languageRecord = _mapToLanguageInfo(context, locale.languageCode);
    return Theme(
      data: ThemeData(
        splashFactory: NoSplash.splashFactory,
        highlightColor: AppColors.transparent,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: languageRecord.icon,
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        title: Text(
          languageRecord.languageName,
          style: AppTextStyle.textSize14(
            fontWeight: FontWeight.bold,
            textColor: AppColors.greenColor.toDarker(0.1),
          ),
        ),
        onTap: () {
          onChange(locale);
        },
      ),
    );
  }
}
