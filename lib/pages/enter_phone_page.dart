import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/authentications/auth.dart';

import '../widgets/my_text_button.dart';
import 'verify_phone_page.dart';

class EnterPhonePage extends StatelessWidget {
  EnterPhonePage({super.key});

  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Please enter your mobile number',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    child: Text(
                      'You’ll receive a 6 digit code to verify next.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xAAAFAFAF)),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/india_flag.png', width: 24),
                            const SizedBox(width: 10),
                            const Text('+91', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: phoneController,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            onChanged: (val) {},
                            validator: (val) {
                              if (val == null ||
                                  val.trim().length != 10 ||
                                  int.tryParse(val) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xAAAFAFAF)),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              hintText: 'Mobile Number',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  MyTextButton(
                    width: double.infinity,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Auth.phoneAuthentication(phoneController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VerifyPhonePage(
                                phoneNumber: phoneController.text),
                          ),
                        );
                      }
                    },
                    buttonText: 'CONTINUE',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Image.asset('assets/images/wave2.png'),
          ],
        ),
      ),
    );
  }
}
