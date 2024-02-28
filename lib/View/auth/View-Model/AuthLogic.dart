// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertynonstop/Style/Constants/AppStrings.dart';
import 'package:propertynonstop/View/auth/Model/AuthModel.dart';
import 'package:propertynonstop/View/home/Home.dart';

enum AuthState {
  initial,
  otpSent,
  verifiedOTP,
  signUp,
  success,
  error,
}

class AuthLogic extends AuthModel {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // void _sendOtp(BuildContext context, String phone) {
  //   login(phone, context);
  // }

  Future<UserCredential> _verifyOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    return await auth.signInWithCredential(credential);
  }

  Future<AuthState> _verifyState(BuildContext context, String otp) async {
    UserCredential cred = await _verifyOtp(otp);
    if (cred.user != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
      return Future.value(AuthState.success);
    } else {
      return Future.value(AuthState.signUp);
    }
  }

  Future<AuthState> requestOTP(BuildContext context, String phone) async {
    await login(phone, context).then((value) => Future.value(state));
    // print('State Value: ${fut.name}');
    return state.value;
  }

  Future<AuthState> submitOTP(BuildContext context, String otp) async {
    state.value = await _verifyState(context, otp);
    return Future.value(state.value);
  }

  String buttonText() {
    if (state.value == AuthState.initial) {
      return AppString.kLoginButtonText;
    } else {
      return AppString.kVerifyOTPText;
    }
  }
}
