import 'package:flutter/material.dart';

import '../authentications/auth.dart';
import '../main.dart';
import 'select_language_page.dart';
import 'select_profile_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (Auth.auth.currentUser != null) {
        //navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SelectProfilePage()),
        );
      } else {
        //navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SelectLanguagePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return SafeArea(child: const Scaffold());
  }
}
