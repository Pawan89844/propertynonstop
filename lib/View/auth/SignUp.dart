// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/Style/Constants/AppStrings.dart';
import 'package:propertynonstop/Widget/AppButtons/AppElevatedButton.dart';
import 'package:propertynonstop/Widget/AppInputField/AppInputField.dart';
import 'package:propertynonstop/Widget/AppText/AppHeadingText.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const AppHeadingText(
              data: 'Let us know about you...', fontSize: 22.0),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kFullNameText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kLoginInputHint),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kCompanyNameText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: 'Enter your e-mail'),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: 'Business since'),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: 'Create Password'),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: 'Confirm Password'),
          const SizedBox(height: 10.0),
          SizedBox(
              width: double.infinity,
              child: AppElevatedButton(onPressed: () {}, data: 'Submit'))
        ],
      ),
    );
  }
}
