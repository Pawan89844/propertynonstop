// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String data;
  const AppText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        textAlign: TextAlign.center, style: GoogleFonts.openSans());
  }
}
