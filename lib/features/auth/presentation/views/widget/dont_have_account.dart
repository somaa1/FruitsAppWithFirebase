import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/signup_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(

      children: [
      TextSpan(
      text: 'لا تمتلك حساب؟ ',
      style: TextStyles.semiBold16.copyWith(
      color: const Color(0xff949D9E),
    ),
    ),
    TextSpan(
    recognizer: TapGestureRecognizer()..onTap = () {
    // Navigate to sign up screen
    Navigator.pushNamed(context,SignupView.routeName );
    },
    text: 'قم بإنشاء حساب',
    style: TextStyles.semiBold16.copyWith(
    color: AppColors.primaryColor,
    ),
    ),
    ],
    ),
    );
  }
}
