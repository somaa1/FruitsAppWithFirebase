import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsecommerce/core/helper_functions/build_error_bar.dart';
import 'package:fruitsecommerce/core/helper_functions/build_success_bar.dart';
import 'package:fruitsecommerce/core/widgets/customprogresshud.dart';

import '../../manger/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          buildSuccessBar(context, 'تمت العملية بنجاح');
        }

        if (state is AddOrderFailure) {
          buildErrorBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is AddOrderLoading, child: child);
      },
    );
  }
}
