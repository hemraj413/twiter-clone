import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  const MenuItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),

      child: Text(text, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600),));
  }
}