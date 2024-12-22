import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsecommerce/features/home/presentation/views/widgets/products_view_body.dart';

import '../../../../core/Service/get_it_service.dart';
import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepo>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}
