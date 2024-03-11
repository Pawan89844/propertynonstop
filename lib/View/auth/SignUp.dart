// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/Style/Constants/AppStrings.dart';
import 'package:propertynonstop/View/post-properties/Property-Info.dart';
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
              data: AppString.kSignUPHeadingText, fontSize: 22.0),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kFullNameText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kLoginInputHint),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kCompanyNameText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kSignUpEmailText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kSignUpBusinessDurationText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kSignUpCreatePasswordText),
          const SizedBox(height: 10.0),
          const AppInputField(hintText: AppString.kSignUpConfirmPasswordText),
          const SizedBox(height: 10.0),
          SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PropertyInfo(),
                      )),
                  data: 'Submit'))
        ],
      ),
    );
  }
}
