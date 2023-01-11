import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const TextWidget(
      {super.key,
        required this.text,
        required this.textStyle,
        this.maxLines = 1,
        this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}