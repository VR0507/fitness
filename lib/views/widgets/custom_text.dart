import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final int? maxLines;
  final Color textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight),
      maxLines: maxLines,
    );
  }
}
