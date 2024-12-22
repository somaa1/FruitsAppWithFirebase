import 'package:flutter/material.dart';
import 'package:fruitsecommerce/core/widgets/custom_app_bar.dart';
import 'package:fruitsecommerce/features/best_selling_fruits/presentation/views/widget/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body:  BestSellingViewBody(),
    );
  }
}
