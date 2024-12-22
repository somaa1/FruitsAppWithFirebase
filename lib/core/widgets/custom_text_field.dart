import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.textInputType,  this.suffixIcon,     this.obscureText=false, this.onSaved });
final String hintText;
final TextInputType textInputType;
final Widget? suffixIcon;
final  void Function(String?)? onSaved;
final bool obscureText;
@override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator:(value) {
        if(value ==null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;


    },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.bold13.copyWith(
          color: Color(0xFF949D9E)
        ),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        border:  buildBorder(),
            enabledBorder: buildBorder(),
        focusedBorder: buildBorder()


      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),


      );
  }
}
