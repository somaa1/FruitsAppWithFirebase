import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsecommerce/core/utils/app_colors.dart';
import 'package:fruitsecommerce/core/utils/app_images.dart';
import 'package:fruitsecommerce/core/widgets/custom_button.dart';
import 'package:fruitsecommerce/core/widgets/custom_password_filed.dart';
import 'package:fruitsecommerce/core/widgets/custom_text_field.dart';
import 'package:fruitsecommerce/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/widget/or_divider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_account.dart';
import 'social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور ؟',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            CustomButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل دخول'),
            const SizedBox(
              height: 33,
            ),
            const Center(
              child: DontHaveAccount(),
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesGoogleIcon,
              title: 'تسجيل بواسطة جوجل',
              onPressed: () {
                context.read<SigninCubit>().signinWithGoogle();

              },
            ),
            const SizedBox(
              height: 16,
            ),
           if (Platform.isIOS) Column(children: [
             SocialLoginButton(
               image: Assets.imagesApplIcon,
               title: 'تسجيل بواسطة أبل',
               onPressed: () {},
             ),
             const SizedBox(
               height: 16,
             ),
           ],),
            SocialLoginButton(
              image: Assets.imagesFacebookIcon,
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {
                context.read<SigninCubit>().signinWithFacebook();
              },
            )
          ]),
        ),
      ),
    );
  }
}
