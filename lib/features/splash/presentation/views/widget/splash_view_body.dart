import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitsecommerce/core/Service/firebase_auth_service.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/signin_view.dart';
import 'package:fruitsecommerce/features/on_boarding/presentation/views/on_boarding.dart';

import '../../../../../constants.dart';
import '../../../../../core/Service/shared_prefrences_singleton.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../home/presentation/views/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation(); //فنكشن بتاخر وبتودي على بوردينج
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        )
      ],
    );
  }

  void executeNavigation() async {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    await Future.delayed(Duration(seconds: 2));
    if (isOnBoardingViewSeen) {
      var islLoggedIn = FirebaseAuthService().isLoggedIn();
      if (islLoggedIn) {
        await Navigator.pushReplacementNamed(context, MainView.routeName);
      } else {
        await Navigator.pushReplacementNamed(context, SigninView.routeName);
      }
    } else {
      await Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }
}
