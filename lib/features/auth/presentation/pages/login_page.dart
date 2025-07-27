import 'package:flutter/material.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_duration.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';
import 'package:soundx/soundx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageController();
}

class _LoginPageController extends State<LoginPage>
    with WidgetsBindingObserver {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  double _keyboardHeight = 0;

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
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    //Detect the bottomInset when the keyboard shown
    final bottomInset = View.of(context).viewInsets.bottom;
    setState(() {
      _keyboardHeight = bottomInset;
    });
  }

  void _onPressForgotPasswordLink() {
    print('Press forgot password link');
  }

  void _onPressLogin() {
    print('Press login button');
  }

  void _onPressSignUp() {
    print('Press sign up button');
  }

  void _onPressLoginWithGoogle() {
    print('Press login with google');
  }

  @override
  Widget build(BuildContext context) {
    return _LoginPageView(this);
  }
}

class _LoginPageView extends WidgetView<LoginPage, _LoginPageController> {
  const _LoginPageView(super.state, {super.key});

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
            child: AnimatedPadding(
              duration: AppDuration.to100Milis(),
              padding: state._keyboardHeight.bottomPadding,
              child: Column(
                children: <Widget>[
                  AppSizes.s32.verticalGap,
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
                ],
              ),
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
          controller: state._loginController,
          hintText: emailHint,
          filled: true,
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._passwordController,
          hintText: passwordHint,
          filled: true,
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
          label: loginWithGoogleLabel,
          leadingIcon: AppAssets.iconsGoogleIcon.svg(),
          backgroundColor: AppColors.secondaryColor,
          onPressed: state._onPressLoginWithGoogle,
        ),
      ],
    );
  }
}
