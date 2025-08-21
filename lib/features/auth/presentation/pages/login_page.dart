import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_notification/overlay_notification.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/core/navgiation/navigation_config.dart';
import 'package:soundx/features/auth/presentation/providers/auth_providers.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';
import 'package:soundx/features/shared/presentation/providers/language_providers.dart';
import 'package:soundx/features/shared/presentation/widget/language_button.dart';
import 'package:soundx/soundx.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageController();
}

class _LoginPageController extends ConsumerState<LoginPage>
    with WidgetsBindingObserver {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isKeyboardShowing = false;
  final GlobalKey _googleButtonKey = GlobalKey();
  final GlobalKey _emailFieldKey = GlobalKey();
  bool _isValidEmail = false;
  bool _isValidPassword = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    //Detect the bottomInset when the keyboard shown
    final bottomInset = View.of(context).viewInsets.bottom;
    setState(() {
      if (bottomInset > 0) {
        _isKeyboardShowing = true;
      } else {
        _isKeyboardShowing = false;
      }
    });
  }

  void _onPressForgotPasswordLink() {
    goRouterConfig.push('\\forgot-password');
  }

  void _onPressLogin() {
    print('Press login button');
    if (!_isValidEmail || !_isValidPassword) {
      toast(context.tr.fillAllRequired);
      return;
    }

    //Login here
  }

  void _onPressSignUp() {
    goRouterConfig.push('\\sign-up');
  }

  void _onPressLoginWithGoogle() {
    print('Press login with google');
    ref.read(signInWithGoogleProvider);
  }

  @override
  Widget build(BuildContext context) {
    return _LoginPageView(this, ref: ref);
  }
}

class _LoginPageView extends WidgetView<LoginPage, _LoginPageController> {
  const _LoginPageView(super.state, {super.key, this.ref});

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
        child: Padding(
          padding: AppSizes.s16.horizontalPadding,
          child: SingleChildScrollView(
            controller: state._scrollController,
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Container(
                    padding: AppSizes.s8.topPadding,
                    alignment: Alignment.centerLeft,
                    child: LanguageButton(
                      onSelect: (locale) {
                        ref?.read(languageProvider.notifier).state = locale;
                      },
                    ),
                  ),
                ),
                // AppSizes.s32.verticalGap,
                FractionallySizedBox(
                  widthFactor: AppPercents.p50,
                  child: AppAssets.pngSoundxLogo.image(),
                ),
                AppSizes.s10.verticalGap,
                Text(
                  context.tr.appName.toUpperCase(),
                  style: AppTextStyle.textSize20(fontWeight: FontWeight.bold),
                ),
                AppSizes.s32.verticalGap,
                _buildTextFields(
                  emailHint: context.tr.loginEmailHintText,
                  passwordHint: context.tr.loginPasswordHintText,
                  hintLink: context.tr.forgotPassword,
                ),
                AppSizes.s10.verticalGap,
                _buildButtons(
                  loginLabel: context.tr.pageLoginButtonTitle,
                  signUpLabel: context.tr.pageRegisterButtonTitle,
                  loginWithGoogleLabel: context.tr.loginWithGoogle,
                  orLabel: context.tr.or,
                ),
                AppSizes.s32.verticalGap,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields({
    required String emailHint,
    required String passwordHint,
    required String hintLink,
  }) {
    return Column(
      children: <Widget>[
        AppTextField(
          key: state._emailFieldKey,
          controller: state._loginController,
          hintText: emailHint,
          filled: true,
          keyboardType: TextInputType.emailAddress,
          validateType: ValidateType.email,
          onValid: (isValid) => state._isValidEmail = isValid,
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._passwordController,
          hintText: passwordHint,
          filled: true,
          // obscureText: true,
          validateType: ValidateType.password,
          onValid: (isValid) => state._isValidPassword = isValid,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: AppButton(
            label: hintLink,
            onPressed: state._onPressForgotPasswordLink,
            buttonType: AppButtonType.link,
          ),
        ),
      ],
    );
  }

  Widget _buildButtons({
    required String loginLabel,
    required String signUpLabel,
    required String loginWithGoogleLabel,
    required String orLabel,
  }) {
    return Column(
      children: <Widget>[
        AppButton(label: loginLabel, onPressed: state._onPressLogin),
        AppSizes.s10.verticalGap,
        AppButton(
          label: signUpLabel,
          onPressed: state._onPressSignUp,
          buttonType: AppButtonType.outline,
        ),
        Padding(
          padding: AppSizes.s10.allPadding,
          child: Text(orLabel, style: AppTextStyle.textSize16()),
        ),
        AppButton(
          key: state._googleButtonKey,
          label: loginWithGoogleLabel,
          leadingIcon: AppAssets.iconsGoogleIcon.svg(),
          backgroundColor: AppColors.secondaryColor,
          onPressed: state._onPressLoginWithGoogle,
        ),
      ],
    );
  }
}
