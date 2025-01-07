// ignore: file_names
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextWidget(
      {super.key,
      required this.text,
      this.style,
      this.textAlign,
      this.fontWeight,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
