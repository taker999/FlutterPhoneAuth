import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_auth/firebase_options.dart';

import 'pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(const MyApp());
  });
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Auth',
      home: SplashPage(),
    );
  }
}
