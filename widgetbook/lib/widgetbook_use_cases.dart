import 'package:flutter/cupertino.dart';
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
          label: 'Login',
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
