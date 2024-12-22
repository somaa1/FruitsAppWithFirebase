import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsecommerce/core/helper_functions/build_error_bar.dart';
import 'package:fruitsecommerce/core/helper_functions/build_success_bar.dart';
import 'package:fruitsecommerce/core/widgets/customprogresshud.dart';
import 'package:fruitsecommerce/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/widget/signin_view_body.dart';
import 'package:fruitsecommerce/features/home/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyConsumer extends StatelessWidget {
  const SigninViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {

        if (state is SigninSuccess) {
          buildSuccessBar(context, "تم تسجيل الدخول بنجاح! ");
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}

