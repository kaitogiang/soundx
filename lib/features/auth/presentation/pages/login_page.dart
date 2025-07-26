import 'package:flutter/cupertino.dart';
import 'package:soundx/core/constants/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
