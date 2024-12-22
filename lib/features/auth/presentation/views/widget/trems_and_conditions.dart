import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsecommerce/core/utils/app_colors.dart';
import 'package:fruitsecommerce/core/utils/app_text_styles.dart';
import 'package:fruitsecommerce/features/auth/presentation/views/widget/custom_check_box.dart';

class TremsAndConditions extends StatefulWidget {
  const TremsAndConditions({super.key, required this.onChanged});
final ValueChanged<bool> onChanged;
  @override
  State<TremsAndConditions> createState() => _TremsAndConditionsState();
}

class _TremsAndConditionsState extends State<TremsAndConditions> {
  bool isTermsAccepted =false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CustomCheckBox(isChecked: isTermsAccepted, onChecked: ( value) {
isTermsAccepted=value;
widget.onChanged(value);
setState(() {});
         }),
        const SizedBox(
          width: 16
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children:  [
                TextSpan(
                  text: 'من خلال إنشاء حساب، فإنك توافق على ',
                  style: TextStyles.semiBold13
                      .copyWith(color: const Color(0xff949D9E)),
                ),
                TextSpan(
                  text: 'الشروط',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
                TextSpan(
                  text: ' و ',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
                TextSpan(
                  text: 'الأحكام الخاصة بنا',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
