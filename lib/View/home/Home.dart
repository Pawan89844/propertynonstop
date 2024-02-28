// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/Widget/AppText/AppText.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: AppText(data: 'Welcome Home'),
    ));
  }
}
