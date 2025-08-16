import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_notification/overlay_notification.dart';
import 'package:soundx/core/constants/app_color.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/core/navgiation/navigation_config.dart';
import 'package:soundx/features/auth/presentation/providers/auth_providers.dart';
import 'package:soundx/features/shared/presentation/base/widget_view.dart';
import 'package:soundx/soundx.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageController();
}

class _SignUpPageController extends ConsumerState<SignUpPage>
    with WidgetsBindingObserver {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isKeyboardShowing = false;
  final GlobalKey _emailFieldKey = GlobalKey();
  final FocusNode _emailFocus = FocusNode();

  bool _isValidEmail = false;
  bool _isValidName = false;
  bool _isValidPassword = false;
  bool _isValidConfirmPassword = false;

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
    _emailFocus.addListener(() {
      Scrollable.ensureVisible(_emailFieldKey.currentContext!);
    });
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
    print('Press forgot password link');
  }

  void _onPressLogin() {
    print('Press login button');
  }

  void _onPressSignUp() {
    print('Press sign up button');
    if (_isValidRequest()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final displayName = _nameController.text.trim();
      print("Valid");
      ref.read(
        signUpProvider((
          email: email,
          password: password,
          displayName: displayName,
          context: context,
        )),
      );
    } else {
      toast(context.tr.fillAllRequired);
    }
  }

  bool _isValidRequest() {
    return _isValidEmail &&
        _isValidName &&
        _isValidPassword &&
        _isValidConfirmPassword;
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

class _LoginPageView extends WidgetView<SignUpPage, _SignUpPageController> {
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
                    AppSizes.s32.verticalGap,
                    _buildButtons(
                      loginLabel: context.tr.pageLoginButtonTitle,
                      signUpLabel: context.tr.pageRegisterButtonTitle,
                      loginWithGoogleLabel: context.tr.loginWithGoogle,
                      orLabel: context.tr.or,
                    ),
                    AppSizes.s20.verticalGap,
                  ],
                ),
              ),
            ),
            Positioned(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSizes.s4),
                  child: IconButton(
                    onPressed: () {
                      goRouterConfig.pop();
                    },
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
          controller: state._emailController,
          hintText: emailHint,
          filled: true,
          keyboardType: TextInputType.emailAddress,
          validateType: ValidateType.email,
          onValid: (value) {
            state._isValidEmail = value;
          },
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._nameController,
          hintText: nameHint,
          filled: true,
          validateType: ValidateType.notEmpty,
          onValid: (value) {
            state._isValidName = value;
          },
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._passwordController,
          hintText: passwordHint,
          filled: true,
          obscureText: true,
          validateType: ValidateType.password,
          onValid: (value) {
            state._isValidPassword = value;
          },
        ),
        AppSizes.s10.verticalGap,
        AppTextField(
          controller: state._confirmPasswordController,
          hintText: confirmHint,
          filled: true,
          obscureText: true,
          validateType: ValidateType.confirmPassword,
          confirmPasswordController: state._passwordController,
          onValid: (value) {
            state._isValidConfirmPassword = value;
          },
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
