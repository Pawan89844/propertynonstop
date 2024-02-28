// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:propertynonstop/Style/Constants/AppStrings.dart';
import 'package:propertynonstop/View/auth/OTP.dart';
import 'package:propertynonstop/View/auth/View-Model/AuthLogic.dart';
import 'package:propertynonstop/View/auth/View-Model/AuthViewModel.dart';
import 'package:propertynonstop/Widget/AppInputField/AppInputField.dart';
import 'package:propertynonstop/Widget/AppText/AppHeadingText.dart';
import 'package:propertynonstop/Widget/AppText/AppText.dart';
import 'package:provider/provider.dart';

import '../../Widget/AppButtons/AppElevatedButton.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .3,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/svg/authentication.svg')),
                Container(
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppHeadingText(data: AppString.kLoginHeading),
                      AppText(data: AppString.kLoginSubHeading)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListenableProvider(
                  create: (_) => AuthViewModel(),
                  child: Consumer<AuthViewModel>(
                    builder: (context, auth, __) {
                      return LoginComposite(
                          phoneController: _phoneController, auth: auth);
                    },
                  )),
            ),
          )
        ],
      )),
    );
  }
}

class LoginComposite extends StatefulWidget {
  final AuthViewModel auth;
  const LoginComposite({
    super.key,
    required this.auth,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  State<LoginComposite> createState() => _LoginCompositeState();
}

class _LoginCompositeState extends State<LoginComposite> {
  final List<TextEditingController> _otpController = <TextEditingController>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.auth.state == AuthState.initial) ...[
          AppInputField(
              controller: widget._phoneController,
              hintText: AppString.kLoginInputHint),
        ],
        if (widget.auth.state == AuthState.otpSent) ...[
          OTP(controller: _otpController),
        ],
        Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AppElevatedButton(
              onPressed: () =>
                  widget.auth.sendOTP(context, widget._phoneController.text),
              data: AppString.kLoginButtonText,
            ))
      ],
    );
  }
}
