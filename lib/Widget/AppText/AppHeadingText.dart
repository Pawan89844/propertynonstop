// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeadingText extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  const AppHeadingText(
      {super.key,
      required this.data,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 25.0,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        textAlign: textAlign,
        style: GoogleFonts.playfairDisplay(
            fontWeight: fontWeight, fontSize: fontSize));
  }
}
