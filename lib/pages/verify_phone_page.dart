import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_phone_auth/authentications/auth.dart';
import 'package:flutter_phone_auth/utils/dialogs.dart';

import '../main.dart';
import '../widgets/my_text_button.dart';
import 'select_profile_page.dart';

class VerifyPhonePage extends StatefulWidget {
  const VerifyPhonePage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerifyPhonePage> createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  String otp = '';

  int _start = 70;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        _start--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Verify Phone',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Code is sent to ${widget.phoneNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              OtpTextField(
                fieldWidth: mq.width * .132,
                numberOfFields: 6,
                filled: true,
                fillColor: const Color(0xFF93D2F3),
                borderRadius: BorderRadius.circular(0),
                borderWidth: 0,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  otp = verificationCode;
                }, // end onSubmit
              ),
              const SizedBox(height: 24),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: 'Request Again',
                      style: const TextStyle(
                        color: Color(0xFF061D28),
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (_start == 0) {
                            Dialogs.showProgressBar(context);
                            Auth.phoneAuthentication(widget.phoneNumber).then(
                              (_) => Navigator.pop(context),
                            );
                          } else {
                            Dialogs.showSnackBar(context,
                                'Please try again after $_start seconds');
                          }
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              MyTextButton(
                width: double.infinity,
                onPressed: () {
                  // Auth.verifyOTP(otp);
                  Dialogs.showProgressBar(context);
                  Auth.verifyOTP(otp).then((val) {
                    Navigator.pop(context);
                    log(val.toString());
                    val
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SelectProfilePage(),
                            ),
                            (route) => false,
                          )
                        : Dialogs.showSnackBar(context, 'Invalid otp');
                  });
                },
                buttonText: 'VERIFY AND CONTINUE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
