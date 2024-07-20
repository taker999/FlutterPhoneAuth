import 'package:flutter/material.dart';

import '../main.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key, required this.width, required this.onPressed, required this.buttonText,
  });

  final double width;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(width, mq.height * .07),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2E3B62),
        shape: const RoundedRectangleBorder(),
      ),
      child: Text(buttonText, style: const TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),),
    );
  }
}
