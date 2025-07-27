import 'package:flutter/cupertino.dart';
import 'package:soundx/core/extensions/context_extension.dart';
import 'package:soundx/soundx.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default AppTextField', type: AppTextField)
Widget defaultAppTextField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: AppTextField(
      controller: TextEditingController(),
      hintText: 'Email',
      filled: true,
    ),
  );
}

@UseCase(name: 'Default AppButton', type: AppButton)
Widget defaultAppButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        AppButton(
          label: context.tr.pageLoginButtonTitle,
          onPressed: () {
            print('Press button');
          },
        ),
        10.0.verticalGap,
        AppButton(
          label: 'Login',
          onPressed: () {
            print('Press button');
          },
          buttonType: AppButtonType.outline,
        ),
        10.0.verticalGap,
        AppButton(
          onPressed: () {
            print('Press button icon');
          },
          label: 'Button With Icon',
          leadingIcon: AppAssets.iconsGoogleIcon.svg(),
        ),
        AppButton(
          label: 'forgot password',
          buttonType: AppButtonType.link,
          onPressed: () {
            print('Click on forgot password');
          },
        ),
      ],
    ),
  );
}

@UseCase(name: 'Default Login Page', type: LoginPage)
Widget defaultLoginPage(BuildContext context) {
  return LoginPage();
}
