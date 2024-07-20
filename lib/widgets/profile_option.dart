import 'package:flutter/material.dart';

import '../main.dart';

class ProfileOption extends StatefulWidget {
  ProfileOption({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.selectedProfile,
    required this.onTap,
    required this.onChanged,
  });

  final Image image;
  final String title;
  final String subtitle;
  final String value;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  String selectedProfile;

  @override
  State<ProfileOption> createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: mq.height * .12,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Row(
            children: [
              Radio(
                splashRadius: 0,
                value: widget.value,
                groupValue: widget.selectedProfile,
                onChanged: widget.onChanged,
              ),
              Expanded(
                child: ListTile(
                  leading: widget.image,
                  title: Text(widget.title, style: const TextStyle(color: Color(0xFF2F3037),fontSize: 20),),
                  subtitle: Text(widget.subtitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
