import 'package:deepvid/constant/color.dart';
import 'package:deepvid/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String headerText;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.headerText,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 4),
          child: Container(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: headerText,
              color: white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          style: TextStyle(color: white),
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: textFormFieldColor,
            suffixIcon: suffixIcon ?? null ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: textFormFieldBorderColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: textFormFieldBorderColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: textFormFieldBorderColor, width: 2),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: grey),
          ),
          validator: (value) => null,
        ),
      ],
    );
  }
}
