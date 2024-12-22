import 'package:flutter/material.dart';
import 'package:fruitsecommerce/features/splash/presentation/views/Widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = "splash";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
