import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/signin_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/Service/shared_prefrences_singleton.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subtitle,
      required this.title,
      required this.isVisible});

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    image,
                  )),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: (){
                    Prefs.setBool(kIsOnBoardingViewSeen, true);

                    Navigator.of(context).pushReplacementNamed(SigninView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('تخط',style: TextStyles.bold13.copyWith(color: Color(0xff9449D9E)),),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 65,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff4E5446)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
