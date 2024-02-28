// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/Widget/AppText/AppText.dart';

class AppSnackBar {
  static void appSnackBar(BuildContext context, String data) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: AppText(data: data)));
  }
}
