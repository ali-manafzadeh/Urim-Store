import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String text;
  final Function(String) onChanged;
  final bool checkPassword;

  // const CustomInput({super.key});

  CustomInput(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.checkPassword});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 237, 237),
          borderRadius: BorderRadius.circular(13)),
      child: TextField(
        obscureText: checkPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 22)),
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
