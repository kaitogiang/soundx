import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/features/auth/presentation/providers/auth_providers.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';
import 'package:soundx/soundx.dart';

class CheckYourEmailPage extends ConsumerStatefulWidget {
  const CheckYourEmailPage({super.key});

  @override
  ConsumerState<CheckYourEmailPage> createState() =>
      _CheckYourEmailController();
}

class _CheckYourEmailController extends ConsumerState<CheckYourEmailPage>
    with WidgetsBindingObserver {
  final _emailController = TextEditingController();
  final _scrollController = ScrollController();
  final GlobalKey _emailFieldKey = GlobalKey();
  final FocusNode _emailFocus = FocusNode();

  bool _isValidEmail = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _emailFocus.addListener(() {
      Scrollable.ensureVisible(_emailFieldKey.currentContext!);
    });
  }

  void _onBackToLogin() {
    context.go('\\login');
  }

  @override
  Widget build(BuildContext context) {
    return _CheckYourEmailPageView(this, ref: ref);
  }
}

class _CheckYourEmailPageView
    extends WidgetView<CheckYourEmailPage, _CheckYourEmailController> {
  const _CheckYourEmailPageView(super.state, {super.key, this.ref});

  final WidgetRef? ref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.whiteColor,
              AppColors.whiteColor,
              AppColors.greenColor,
            ],
            stops: [AppPercents.p0, AppPercents.p50, AppPercents.p100],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: state._scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: context.heightScreen),
                child: Padding(
                  padding: AppSizes.s10.horizontalPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AppSizes.s32.verticalGap,
                      FractionallySizedBox(
                        widthFactor: AppPercents.p50,
                        child: AppAssets.pngCheck.image(),
                      ),
                      AppSizes.s10.verticalGap,
                      Text(
                        context.tr.checkYourEmailTitle,
                        style: AppTextStyle.textSize20(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.tr.pleaseCheckYourMail,
                        style: AppTextStyle.textSize16(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        context.tr.weHaveSentEmailWithLink,
                        style: AppTextStyle.textSize16(),
                        textAlign: TextAlign.center,
                      ),
                      AppSizes.s32.verticalGap,
                      _buildButtons(backLabel: context.tr.backToLogin),
                      AppSizes.s20.verticalGap,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: AppSizes.s8.bottomPadding,
      child: Text(
        title,
        style: AppTextStyle.textSize18(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTermsAndPolicy({
    required BuildContext context,
    VoidCallback? onPressTerm,
    VoidCallback? onPressPolicy,
  }) {
    final baseString = context.tr.agreeString;
    final andString = context.tr.andString;
    final terms = context.tr.termsOfService;
    final privacy = context.tr.privacyPolicy;
    final textStyle = AppTextStyle.textSize14();
    final underlineStyle = AppTextStyle.textSize14(
      textColor: AppColors.linkColor,
    );
    final gestureConfig = (
      onTapTerms: TapGestureRecognizer()..onTap = onPressTerm,
      onTapPolicy: TapGestureRecognizer()..onTap = onPressPolicy,
    );

    return Consumer(
      builder: (context, ref, child) {
        final isCheck = ref.watch(termsAgreementProvider);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              value: isCheck,
              onChanged: (value) {
                ref.read(termsAgreementProvider.notifier).state =
                    value ?? false;
              },
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: baseString, style: textStyle),
                    TextSpan(
                      text: terms,
                      style: underlineStyle,
                      recognizer: gestureConfig.onTapTerms,
                    ),
                    TextSpan(text: andString, style: textStyle),
                    TextSpan(
                      text: privacy,
                      style: underlineStyle,
                      recognizer: gestureConfig.onTapPolicy,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextFields({
    required String emailHint,
    required String nameHint,
    required String passwordHint,
    required String confirmHint,
  }) {
    return Column(
      children: <Widget>[
        AppTextField(
          controller: state._emailController,
          hintText: emailHint,
          filled: true,
          keyboardType: TextInputType.emailAddress,
          validateType: ValidateType.email,
          textInputAction: TextInputAction.done,
          onValid: (value) {
            state._isValidEmail = value;
          },
        ),
      ],
    );
  }

  Widget _buildButtons({required String backLabel}) {
    return Column(
      children: <Widget>[
        AppButton(label: backLabel, onPressed: state._onBackToLogin),
        AppSizes.s10.verticalGap,
      ],
    );
  }
}
