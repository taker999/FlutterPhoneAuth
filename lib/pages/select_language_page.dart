import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/my_dropdown_menu.dart';
import '../widgets/my_text_button.dart';
import 'enter_phone_page.dart';

class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: mq.height * .13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image_outlined,
                size: 75,
                color: Colors.grey,
              ),
              const SizedBox(height: 30),
              const Text(
                'Please select your Language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  'You can change the language at any time.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const MyDropdownMenu(),
              const SizedBox(height: 20),
              MyTextButton(
                width: mq.width * .6,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EnterPhonePage())),
                buttonText: 'NEXT',
              ),
              const Spacer(),
              Image.asset('assets/images/wave1.png'),
            ],
          ),
        ),
      ),
    );
  }
}
