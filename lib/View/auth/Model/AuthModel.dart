// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:propertynonstop/View/auth/View-Model/AuthLogic.dart';
import 'package:propertynonstop/Widget/snackbar/AppSnackbar.dart';

class AuthModel extends AuthOps {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  Future<void> login(String phoneNo, BuildContext context) async {
    return await _auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNo',
      verificationCompleted: (phoneAuthCredential) =>
          _isVerificationCompleted(phoneAuthCredential, auth),
      verificationFailed: (error) => _isVerificationFailed,
      codeSent: (verificationId, forceResendingToken) =>
          _isCodeSent(verificationId, forceResendingToken, auth),
      codeAutoRetrievalTimeout: _codeRetrieval,
    );
  }

  void signUp() async {}

  void logout() async {
    await _auth.signOut();
  }
}

class AuthOps {
  // AuthState _state = AuthState.initial;
  String _verificationId = '';
  // AuthState state = AuthState.initial;
  ValueNotifier<AuthState> state = ValueNotifier(AuthState.initial);
  ValueNotifier<AuthState> get logicState => state;
  String get verificationId => _verificationId;

  void _isCodeSent(String verificationId, int? forceResendingToken,
      FirebaseAuth auth) async {
    print(
        'VerificationId : $verificationId ForceResendingToken: $forceResendingToken');
    if (verificationId.isNotEmpty) {
      _verificationId = verificationId;
      state.value = AuthState.otpSent;
      print('State ValueL ${state.value.name}');
    }
  }

  void _isVerificationCompleted(
      PhoneAuthCredential phoneAuthCredential, FirebaseAuth auth) async {
    print(
        'Verification Complete: ${phoneAuthCredential.smsCode}, Verification Id: ${phoneAuthCredential.verificationId}');
    await auth.signInWithCredential(phoneAuthCredential);
  }

  void _isVerificationFailed(
      FirebaseAuthException error, BuildContext context) {
    AppSnackBar.appSnackBar(context, error.toString());
  }

  void _codeRetrieval(String verificationId) {
    print('Code Retrieval : $verificationId');
  }
}
