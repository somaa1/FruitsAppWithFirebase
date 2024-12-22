import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitsecommerce/constants.dart';
import 'package:fruitsecommerce/core/Service/shared_prefrences_singleton.dart';
import 'package:fruitsecommerce/core/utils/app_colors.dart';
import 'package:fruitsecommerce/core/widgets/custom_button.dart';
import 'package:fruitsecommerce/features/on_boarding/presentation/views/widget/on_boarding_page_view.dart';

import '../../../../auth/presentation/views/signin_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator( activeColor: AppColors.primaryColor ,
              color:  currentPage==1 ?
              AppColors.primaryColor : AppColors.primaryColor.withOpacity(.5) ),
        ),
        const SizedBox(height: 30),
        SizedBox(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Visibility(
              visible: currentPage == 1 ? true : false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: CustomButton(
                onPressed: () {
Prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(context).pushReplacementNamed(SigninView.routeName);

                },
                text: 'ابدأ الان',
              )),
        )),
        const SizedBox(height: 43),

      ],
    );
  }
}
