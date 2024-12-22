import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsecommerce/constants.dart';
import 'package:fruitsecommerce/core/helper_functions/build_error_bar.dart';
import 'package:fruitsecommerce/core/widgets/custom_button.dart';
import 'package:fruitsecommerce/core/widgets/custom_text_field.dart';
import 'package:fruitsecommerce/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/widget/have_an_account.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/widget/trems_and_conditions.dart';

import '../../../../../core/widgets/custom_password_filed.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    userName = value!;
                  },
                  hintText: "الاسم كامل",
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: "البريد الإلكتروني",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TremsAndConditions(
                onChanged: (bool value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserAndPassword(email, password, userName);
                      }else{
                        buildErrorBar(context, "يجب عليك الموافقة على الشروط والاحكام");
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "تسجيل"),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
