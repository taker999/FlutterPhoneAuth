import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  static String _verificationId = '';

  static Future<void> phoneAuthentication(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      timeout: const Duration(seconds: 50),
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        log('failed');
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  static Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otp));
      return credentials.user != null;
    } on Exception catch (_) {
      return false;
    }
  }
}