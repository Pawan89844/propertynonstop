// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/Widget/AppText/AppButtonText.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String data;
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: AppButtonText(
          data: data,
        ));
  }
}
