import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentications/auth.dart';
import '../utils/dialogs.dart';
import '../widgets/my_text_button.dart';
import '../widgets/profile_option.dart';
import 'select_language_page.dart';

class SelectProfilePage extends StatefulWidget {
  const SelectProfilePage({super.key});

  @override
  State<SelectProfilePage> createState() => _SelectProfilePageState();
}

class _SelectProfilePageState extends State<SelectProfilePage> {
  String selectedProfile = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  Dialogs.showProgressBar(context);
                  // sign out from app
                  await Auth.auth.signOut().then((value) async {
                    // for hiding progress dialog
                    Navigator.pop(context);

                    Auth.auth = FirebaseAuth.instance;

                    // replacing home screen with login screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SelectLanguagePage(),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Please select your profile',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ProfileOption(
                image: Image.asset('assets/images/shipper.png'),
                title: 'Shipper',
                subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
                value: 'shipper',
                selectedProfile: selectedProfile,
                onTap: () {
                  setState(() {
                    selectedProfile = 'shipper';
                  });
                },
                onChanged: (String? val) {
                  setState(() {
                    selectedProfile = 'shipper';
                  });
                },
              ),
              ProfileOption(
                image: Image.asset('assets/images/transporter.png'),
                title: 'Transporter',
                subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
                value: 'transporter',
                selectedProfile: selectedProfile,
                onTap: () {
                  setState(() {
                    selectedProfile = 'transporter';
                  });
                },
                onChanged: (String? val) {
                  setState(() {
                    selectedProfile = 'transporter';
                  });
                },
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MyTextButton(
                  width: double.infinity,
                  onPressed: () {},
                  buttonText: 'CONTINUE',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
