// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonText extends StatelessWidget {
  final String data;
  final Color? color;
  const AppButtonText(
      {super.key, required this.data, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.ptSerif(color: color),
    );
  }
}
