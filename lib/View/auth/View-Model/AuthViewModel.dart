// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/View/auth/View-Model/AuthLogic.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthLogic _logic = AuthLogic();
  // bool _isOTPSent = false;
  AuthState state = AuthState.initial;

  AuthLogic get logic => _logic;

  // AuthState get state => _state;

  void sendOTP(BuildContext context, String phone) async {
    AuthState myState = await _logic.requestOTP(context, phone);
    state = myState;
    notifyListeners();
  }

  void verifyOTP(
      BuildContext context, List<TextEditingController> otpController) async {
    String otp = otpController.map((e) => e.text.trim()).join();
    AuthState myState = await _logic.submitOTP(context, otp);
    state = myState;
    notifyListeners();
  }
}
