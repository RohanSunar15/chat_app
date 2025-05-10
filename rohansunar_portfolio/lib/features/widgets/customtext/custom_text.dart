import 'package:flutter/material.dart';
import 'package:rohansunar_portfolio/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;


  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.onTap,
    this.padding,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: padding ??  const EdgeInsets.all(0.0),
       child: GestureDetector(
         onTap: onTap,
         child: Text(
          text,
          style: TextStyle(
              color: color ?? AppColors.white,
              fontSize: fontSize ?? 15,
              fontWeight: fontWeight ?? FontWeight.w500,
          ),
           textAlign: textAlign,
             ),
       ),
     );
  }
}
