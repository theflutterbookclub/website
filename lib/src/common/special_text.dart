import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final String? fontfamily;
  final TextDecoration? decoration;
  final bool? isUnderLine;
  final double? fontSize;
  const SpecialText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.decoration,
    this.isUnderLine,
    this.fontfamily,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: fontfamily,
        decoration: isUnderLine == true ? TextDecoration.underline : decoration,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight,
      ),
    );
  }
}
