import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final String text;
  final String labelText;

  const ProfileField({
    Key? key,
    required this.text,
    required this.labelText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}