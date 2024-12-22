import 'package:flutter/material.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/signin_view.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:fruitsecommerce/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruitsecommerce/features/home/presentation/views/main_view.dart';
import 'package:fruitsecommerce/features/on_boarding/presentation/views/on_boarding.dart';
import 'package:fruitsecommerce/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (BuildContext context) => SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => SignupView());
    case MainView.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => BestSellingView());
    default:
      return MaterialPageRoute(
          builder: (BuildContext context) =>
              Scaffold(body: Center(child: Text('Page not found'))));
  }
}
