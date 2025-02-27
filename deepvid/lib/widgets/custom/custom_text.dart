import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.recognizer,
    this.color,
    this.decoration,
    this.textSpan,
    this.gradient,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily;
  final GestureRecognizer? recognizer;
  final Color? color;
  final TextDecoration? decoration;
  final textSpan;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: gradient == null ? color : null,
      decoration: decoration,
    );

    if (gradient != null && text != null) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: baseStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      final textWidth = textPainter.width;
      final textHeight = textPainter.height;

      final gradientStyle = baseStyle.copyWith(
        foreground: Paint()
          ..shader = gradient!.createShader(
            Rect.fromLTWH(0, 0, textWidth, textHeight),
          ),
      );

      return SizedBox(
        width: width ?? textWidth,
        height: height ?? textHeight,
        child: RichText(
          text: TextSpan(
            text: text,
            style: gradientStyle,
            recognizer: recognizer,
          ),
        ),
      );
    } else {
      // Regular text without gradient.
      return SizedBox(
        width: width,
        height: height,
        child: RichText(
          text: TextSpan(
            text: text,
            style: baseStyle,
            recognizer: recognizer,
          ),
        ),
      );
    }
  }
}
