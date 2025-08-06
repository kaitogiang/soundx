import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/features/auth/presentation/providers/auth_providers.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';
import 'package:soundx/soundx.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _LoginPageController();
}

class _LoginPageController extends ConsumerState<SignUpPage>
    with WidgetsBindingObserver {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isKeyboardShowing = false;
  final GlobalKey _googleButtonKey = GlobalKey();
  final GlobalKey _emailFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(_emailFieldKey.currentContext!);
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
    ref.read(signInWithGoogleProvider);
  }

  @override
  Widget build(BuildContext context) {
    return _LoginPageView(this, ref: ref);
  }
}

class _LoginPageView extends WidgetView<SignUpPage, _LoginPageController> {
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
        child: Stack(
          children: [
            Padding(
              padding: AppSizes.s16.horizontalPadding,
              child: SingleChildScrollView(
                controller: state._scrollController,
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
                      style: AppTextStyle.textSize20(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSizes.s32.verticalGap,
                    _buildFormTitle(context.tr.createYourAccount),
                    _buildTextFields(
                      emailHint: context.tr.loginEmailHintText,
                      nameHint: context.tr.signedUpName,
                      passwordHint: context.tr.loginPasswordHintText,
                      confirmHint: context.tr.confirmPassword,
                    ),
                    AppSizes.s10.verticalGap,
                    _buildTermsAndPolicy(
                      context: context,
                      onPressPolicy: () {
                        print('Press Policy');
                      },
                      onPressTerm: () {
                        print('Press Term');
                      },
                    ),
                    AppSizes.s12.verticalGap,
                    _buildButtons(
                      loginLabel: context.tr.pageLoginButtonTitle,
                      signUpLabel: context.tr.pageRegisterButtonTitle,
                      loginWithGoogleLabel: context.tr.loginWithGoogle,
                      orLabel: context.tr.or,
                    ),
                    if (state._isKeyboardShowing) AppSizes.s10.verticalGap,
                  ],
                ),
              ),
            ),
            Positioned(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSizes.s4),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
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
          key: state._emailFieldKey,
          controller: state._emailController,
          hintText: emailHint,
          filled: true,
          keyboardType: TextInputType.emailAddress,
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._nameController,
          hintText: nameHint,
          filled: true,
          obscureText: true,
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._passwordController,
          hintText: passwordHint,
          filled: true,
          obscureText: true,
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._confirmPasswordController,
          hintText: confirmHint,
          filled: true,
          obscureText: true,
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
        AppButton(label: signUpLabel, onPressed: state._onPressSignUp),
      ],
    );
  }
}
