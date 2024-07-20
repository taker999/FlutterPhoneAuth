import 'package:flutter/material.dart';

import '../main.dart';

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({super.key});

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  final List<String> list = ['English', 'Spanish', 'French', 'German'];
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: mq.width * .6,
      hintText: 'English',
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
      )),
      dropdownMenuEntries: list
          .map<DropdownMenuEntry<String>>((val) => DropdownMenuEntry<String>(
                value: val,
                label: val,
              ))
          .toList(),
    );
  }
}
