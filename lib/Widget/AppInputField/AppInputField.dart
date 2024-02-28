// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const AppInputField({super.key, this.controller, this.hintText});

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.grey));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: border(),
            focusedBorder: border(),
            hintText: hintText,
            hintStyle: GoogleFonts.openSans(),
            isDense: true),
      ),
    );
  }
}
