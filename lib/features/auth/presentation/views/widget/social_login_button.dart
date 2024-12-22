import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitsecommerce/core/utils/app_text_styles.dart';


class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed,

});

  final String image;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xffDCDEDE), width: 1),
                  borderRadius: BorderRadius.circular(16))),
          onPressed: onPressed,
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,

            ),
            leading: SvgPicture.asset(image),
            title: Text(title,
                textAlign: TextAlign.center, style: TextStyles.semiBold16),
          )),
    );
  }
}
