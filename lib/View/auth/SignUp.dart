// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/Style/Constants/AppStrings.dart';
import 'package:propertynonstop/Widget/AppInputField/AppInputField.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppInputField(hintText: AppString.kFullNameText),
        AppInputField(hintText: AppString.kLoginInputHint),
        Row(),
        AppInputField(hintText: AppString.kCompanyNameText),
      ],
    );
  }
}
